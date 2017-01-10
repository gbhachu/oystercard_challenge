class Oystercard

DEFAULT_LIMIT = 90
MIN_FARE = 1
attr_reader :balance, :in_journey, :entry_station

	def initialize
	@balance = 0
	@in_journey = false
	@entry_station = nil
	end

	def top_up(amount)
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if @balance + amount > DEFAULT_LIMIT
		@balance += amount
	end

	def touch_in(entry_station)
		raise 'insufficient funds' if @balance < MIN_FARE
		@in_journey = true
		@entry_station = entry_station

	end

	def touch_out(station)
		deduct
		@in_journey = false
		@entry_station = nil

	end

private

	def deduct
		@balance -= MIN_FARE
	end

end
