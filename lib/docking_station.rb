class DockingStation

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end


	def bike_count
		@bikes.count # This counts the number of bikes
	end

	def dock(bike)
		raise "The docking station is full" if full?
		@bikes << bike # this is cause for the 19th time it does not raise the error
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		bike_count == @capacity
	end


	def available_bikes
		@bikes.reject {|bike| bike.broken?}
	end

end