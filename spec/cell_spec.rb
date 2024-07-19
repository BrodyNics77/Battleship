require './lib/ship'
require './lib/cell'

RSpec.configure do |config| 
    config.formatter = :documentation
    end

RSpec.describe 'Cell' do
    before(:each) do
        @cell = Cell.new("B4")
    end

    it 'exists' do
        expect(@cell).to be_a(Cell)
    end

    it 'has a coordinate' do 
        expect(@cell.coordinate).to eq("B4")
    end

    describe 'ship on a cell' do
        it 'returns nil by default' do
        expect(@cell.ship).to eq nil
        end

        it 'is empty when nil' do
            @cell.empty?
            expect(@cell.empty?).to be true
       
        end

        it 'can place a ship' do
            @cruiser = Ship.new("Cruiser", 3)
            @cell.place_ship(@cruiser)

            expect(@cell.ship).to eq(@cruiser)
            expect(@cell.empty?).to be false
        end
        


    end
end
