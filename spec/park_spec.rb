require './lib/passenger'
require './lib/vehicle'
require './lib/park'

RSpec.describe Park do
let(:park) {Park.new("Yellowstone")}
let(:vehicle) {Vehicle.new("2001", "Honda", "Civic")} 
let(:jude) {Passenger.new({"name" => "Jude", "age" => 20})}
let(:taylor) {Passenger.new({"name" => "Taylor", "age" => 12})}
let(:charlie) {Passenger.new({"name" => "Charlie", "age" => 18})}
let(:larry) {Passenger.new({"name" => "Larry", "age" => 8})}

    it 'exists' do
        expect(park).to be_an_instance_of(Park)
    end

    it 'has a name' do
        expect(park.name).to eq("Yellowstone")
    end

    it 'can list vehicles in the park' do
        expect(park.vehicles_in_park).to eq([])
    end

    it 'can add vehicles to park' do
        park.enter_park(vehicle)
        expect(park.vehicles_in_park).to eq([vehicle])
    end

    it 'can list passengers that enter park' do
        expect(park.passengers_in_park).to eq([])
    end

    it 'can add passengers to park' do
        park.passenger_enter(jude)

        expect(park.passengers_in_park).to eq([jude])
    end

    it 'can calculate revenue generated' do
        expect(park.revenue).to eq(0)
    end

    it 'can charge per adult' do
        park.enter_park(vehicle)
        park.passenger_enter(jude)

        park.charge_fee

        expect(park.revenue).to eq(15)

        park.passenger_enter(taylor)
        park.charge_fee
        expect(park.revenue).to eq(30)
    end

    it 'tracks patrons of the park' do
        park.passenger_enter(jude)
        park.passenger_enter(taylor)
        park.passenger_enter(charlie)

        expect(park.patrons).to eq(["Charlie", "Jude", "Taylor"])
    end

    # it 'tracks list of minors and adults' do
    #     park.passenger_enter(jude)
    #     park.passenger_enter(taylor)
    #     park.passenger_enter(charlie)
    #     park.passenger_enter(larry)

    #     expect(park.minor_list).to eq([larry, taylor])
    #     expect(park.adult_list).to eq(["Charlie", "Jude"])
    # end
end