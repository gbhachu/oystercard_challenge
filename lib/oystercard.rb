class Oystercard

DEFAULT_LIMIT = 90
attr_reader :balance#, :limit

	def initialize
	@balance = 0

	end

	def top_up(amount)
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if @balance + amount > DEFAULT_LIMIT
		@balance += amount
	end

	def deduct(fare)
		@balance -= fare
	end
end
