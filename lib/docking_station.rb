class DockingStation

	def initialize
		@bikes = []
	end


	def bike_count
		@bikes.count # This counts the number of bikes
	end

	def dock(bike)
		@bikes << bike
	end

	def release(bike)
		@bikes.delete(bike)
	end

end