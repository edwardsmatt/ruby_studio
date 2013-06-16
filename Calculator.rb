class Calculator 
	def initialize (one=0, two=0)
		@one = one
		@two = two
	end

	def add
		@one + @two
	end
	def subtract 
		@one - @two
	end
end


calc = Calculator.new(20, 11)
puts calc.add
puts calc.subtract