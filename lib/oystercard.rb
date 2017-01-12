require 'station'

class Oystercard

DEFAULT_LIMIT = 90
MIN_FARE = 1
attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey, :amount

	def initialize
	@balance = 0
	@in_journey = false
	@journey = Hash.new


	end

	def top_up(amount)
		@amount = amount
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if at_limit?
		@balance += amount
	end

	def touch_in(entry_station)
		raise 'insufficient funds' if @balance < MIN_FARE
		@in_journey = true
		@entry_station = entry_station

	end

	def touch_out(exit_station)
		deduct
		@in_journey = false
		@entry_station = entry_station
		@exit_station = exit_station
		@journey[entry_station] = exit_station

	end



private

	def deduct
		@balance -= MIN_FARE
	end

	def at_limit?
		@balance + amount > DEFAULT_LIMIT
	end

end
