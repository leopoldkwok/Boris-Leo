class Bike

	def initialize
		@broken = false
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
		self
	end

	def fix!
		@broken = false
	end

end