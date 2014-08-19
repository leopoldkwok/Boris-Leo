require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 
	let(:bike) { Bike.new }
	let(:holder) {ContainerHolder.new}


	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		holder.capacity.times {holder.dock(Bike.new)}
		expect(holder).to be_full
	end

	it "should not accept a bike when it's full" do
		holder.capacity.times {holder.dock(bike)}
		expect(lambda {holder.dock(bike)}).to raise_error(RuntimeError) #why does this need the lamda?
	end

	it "should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break! #need to break the bike to be broken
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike]) #working bikes has enter the array
	end

end