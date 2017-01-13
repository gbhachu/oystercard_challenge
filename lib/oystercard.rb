require_relative 'station'
require_relative 'journey'

class Oystercard

DEFAULT_LIMIT = 90
MIN_FARE = 1
attr_reader :balance, :in_journey, :entry_station, :end_station, :journey, :amount

	def initialize(balance = 0)
	@balance = balance
	@in_journey = false
	@journey = []


	end

	def top_up(amount)
		@amount = amount
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if at_limit?
		@balance += amount
	end

	def touch_in(entry_station)
		raise 'insufficient funds' if @balance < MIN_FARE
		@in_journey = true
		@entry_station = entry_station.name
		#newjourney = Journey.new(@entry_station)

	end

	def touch_out(exit_station)
		deduct
		@in_journey = false
		@end_station = exit_station.name
		@journey << {entry_station:entry_station, exit_station:end_station}
		#deduct @journey.end station
		#newjourney = Journey.new(@end_station)



	end



private

	def deduct
		@balance -= MIN_FARE
	end

	def at_limit?
		@balance + amount > DEFAULT_LIMIT
	end

end
