require './lib/ship'
require './lib/cell'
require './lib/board'

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

        it '#empty? when nil' do
            @cell.empty?
            expect(@cell.empty?).to be true
       
        end

        it '#can place_ship' do
            @cruiser = Ship.new("Cruiser", 3)
            @cell.place_ship(@cruiser)

            expect(@cell.ship).to eq(@cruiser)
            expect(@cell.empty?).to be false
        end
        
    end

    describe 'ship fire upon' do
        it '#fired_upon? default is false' do
            @cruiser = Ship.new("Cruiser", 3)
            @cell.place_ship(@cruiser)

            expect(@cell.fired_upon?).to be false
        
        end

        it 'can be #fired_upon' do
            @cruiser = Ship.new("Cruiser", 3)
            @cell.place_ship(@cruiser)
            @cell.fire_upon

            expect(@cell.ship)
        end

        it '#fired_upon? ship loses health' do
            @cruiser = Ship.new("Cruiser", 3)
            @cell.place_ship(@cruiser)
            @cell.fire_upon

            expect(@cell.fired_upon?).to be true
            expect(@cell.ship.health).to eq(2)
        end
    end
    describe '#render' do
        it 'displays . by default' do
            @cell_1 = Cell.new("B4")

            expect(@cell_1.render).to eq(".")
        end
        it 'displays m when cell has no ship and is fired upon' do
            @cell_1 = Cell.new("B4")
            
            @cell_1.fire_upon

            expect(@cell_1.render).to eq("M")
        end
        it '#displays S when there is a ship on the cell' do
            @cell_2 = Cell.new("A3")

            @cruiser = Ship.new("Cruiser", 3)
            @cell_2.place_ship(@cruiser)

            expect(@cell_2.render(true)).to eq("S")
        end
        it '#displays H when the ship is hit' do
            @cell_2 = Cell.new("A3")

            @cruiser = Ship.new("Cruiser", 3)
            @cell_2.place_ship(@cruiser)

            @cell_2.fire_upon
            
            expect(@cell_2.ship.health).to eq(2)
            expect(@cell_2.render).to eq("H")
        end
    
        it '#displays if ship has been sunk' do
            @cruiser = Ship.new("Cruiser", 3)

            expect(@cruiser.sunk?).to be false

            @cruiser.hit
            @cruiser.hit
            @cruiser.hit

            expect(@cruiser.sunk?).to eq true
        end
        it '#displays X if the ship has been sunk' do
            @cell_2 = Cell.new("A3")
            @cruiser = Ship.new("Cruiser", 3)

            @cell_2.place_ship(@cruiser)

            @cell_2.fire_upon
            @cruiser.hit
            @cruiser.hit

            expect(@cruiser.sunk?).to eq true
            expect(@cell_2.render).to eq("X")
        end
    end
end
