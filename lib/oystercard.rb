class Oystercard

DEFAULT_LIMIT = 90
attr_reader :balance#, :limit

	def initialize
	@balance = 0
	#@limit = DEFAULT_LIMIT
	end

	def top_up(amount)
		err_message = "Limit is #{DEFAULT_LIMIT}, declined"
		raise (err_message) if @balance + amount > DEFAULT_LIMIT
		@balance += amount 
	end

end
