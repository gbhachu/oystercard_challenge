class Oystercard

DEFAULT_LIMIT = 90
MIN_BALANCE = 1
attr_reader :balance, :in_journey

	def initialize
	@balance = 0
	@in_journey = false
	end

	def top_up(amount)
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if @balance + amount > DEFAULT_LIMIT
		@balance += amount
	end

	def deduct(fare)
		@balance -= fare
	end

	def touch_in(station)
		raise 'insufficient funds' if @balance <= MIN_BALANCE
		@in_journey = true

	end

	def touch_out(station)
		@in_journey = false
	end

end
