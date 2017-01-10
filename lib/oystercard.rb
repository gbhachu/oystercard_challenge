class Oystercard

DEFAULT_LIMIT = 90
MIN_FARE = 1
attr_reader :balance, :in_journey

	def initialize
	@balance = 0
	@in_journey = false
	end

	def top_up(amount)
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if @balance + amount > DEFAULT_LIMIT
		@balance += amount
	end

	def touch_in(station)
		raise 'insufficient funds' if @balance < MIN_FARE
		@in_journey = true

	end

	def touch_out(station)
		deduct
		@in_journey = false
	end

private

def deduct
	@balance -= MIN_FARE
end

end
