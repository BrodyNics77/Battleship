require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.configure do |config| 
    config.formatter = :documentation
    end

RSpec.describe 'Board' do
    before(:each) do
        @board = Board.new
    end
    it 'exists' do
        expect(@board).to be_a(Board)
    end

    it 'has cells stored as a hash' do
        expect(@board.cells).to be_a(Hash)
    end

    describe 'validating coordinates' do
        it 'has a total of 16 key/value pairs in the hash' do
            expect(@board.cells.size).to eq(16)
        end
    
        it '#cells knows if a coordinate exists on the board' do
            expect(@board.valid_coordinate?("A1")).to be true
            expect(@board.valid_coordinate?("D1")).to be true
            expect(@board.valid_coordinate?("A5")).to be false
            expect(@board.valid_coordinate?("E1")).to be false
            expect(@board.valid_coordinate?("A22")).to be false
        end        
    end

    describe '#helper methods' do
        it '#length_check? test for false values of a ships length' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.length_check?(cruiser, ["A1", "A2"])).to be false
            expect(@board.length_check?(submarine, ["A2", "A3", "A4"])).to be false
        end

        it '#length_check? test for true values of ship length' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)
            # require 'pry'; binding.pry
            expect(@board.length_check?(cruiser, ["A1", "A2", "A3"])).to be true
            expect(@board.length_check?(submarine, ["A2", "A3"])).to be true
        end

        it '#unique_checker? tests false if coordinates are not consecutive' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.unique_checker?(["B1", "A3"])).to be false
        end

        it '#unique_checker? tests true if letters are sequential' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.unique_checker?(["A1", "A2", "A3"])).to be true
            expect(@board.unique_checker?(["A1", "A2"])).to be true
            expect(@board.unique_checker?(["B1", "C1"])).to be true
            expect(@board.unique_checker?(["A1", "A2", "A4"])).to be false
        end

        it '#consecutive numbers tests false when number isnt sequential' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.consecutive_numbers?(["A1", "A2", "A4"])).to be false
            expect(@board.consecutive_numbers?(["A1", "C1"])).to be false
        end

        it '#consecutive numbers tests true when numbers are sequential' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.consecutive_numbers?(["A1", "A2", "A3"])).to be true
            expect(@board.consecutive_numbers?(["A1", "A2"])).to be true
        end

        it '#consecutive letters tests false when lettes arent sequential' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.consecutive_letters?(["A1", "A2", "C4"])).to be false
            expect(@board.consecutive_letters?(["A1", "C1"])).to be false
    end

        it '#consecutive letters tests true when letters are sequential' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.consecutive_letters?(["A1", "B1", "C1"])).to be true
            expect(@board.consecutive_letters?(["A1", "B1"])).to be true
        end

        it '#diagonal checker tests false if theres diagonal placement' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.diagonal_checker?(["A1", "B2", "C3"])).to eq false
            expect(@board.diagonal_checker?(["A1", "B2"])).to eq false
        end

        it '#overlapping? returns true if place ship overlaps' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            @board.place(cruiser, ["A1", "A2", "A3"])

            expect(@board.overlapping?(submarine, ["A1", "B1"])).to be true
        end
    end

    describe '#valid_placements' do
        it '#valid_placement? test for false values of a ships length' do
            cruiser = Ship.new("Cruiser", 3)
            expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to be false

            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
        end

        it '#valid_placement? test for true values of ship length' do
            cruiser = Ship.new("Cruiser", 3)
            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true

            submarine = Ship.new("Submarine", 2)
            expect(@board.valid_placement?(submarine, ["A2", "A3"])).to be true
        end

        it 'tests for consecutive placement' do
            cruiser = Ship.new("Cruiser", 3)
            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false

            submarine = Ship.new("Submarine", 2)
            expect(@board.valid_placement?(submarine, ["A1", "A2"])).to be true
            expect(@board.valid_placement?(submarine, ["B1", "C1"])).to be true

        end
        it 'tests for false consecutive coordinates' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
            expect(@board.valid_placement?(submarine, ["A1", "C1"])).to be false
        end

        it '#valid_placement? of reverse coordinates' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
            expect(@board.valid_placement?(submarine, ["C1", "B1"])).to be false
        end

        it '#valid_placement? coordinates cannot go diagonal' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
            expect(@board.valid_placement?(submarine, ["C2", "D3"])).to be false
        end

        it '#valid_placement? should be true' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
            expect(@board.valid_placement?(submarine, ["A1", "A2"])).to be true
        end
    end

    describe 'placing ships' do
        it '#place ship on coordinate array' do
            cruiser = Ship.new("Cruiser", 3)
            @board.place(cruiser, ["A1", "A2", "A3"])

            cell_1 = @board.cells["A1"]
            cell_2 = @board.cells["A2"]
            cell_3 = @board.cells["A3"]

            cell_1.ship
            cell_2.ship
            cell_3.ship

            expect(cell_3.ship).to eq(cruiser)
            expect(cell_1.ship == cell_3.ship).to be true
        end

        xit '#valid_placement? ships cannot overlap' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            @board.place(cruiser, ["A1", "A2", "A3"])

            expect(@board.valid_placement?(submarine, ["A1", "B1"])).to be false
        end
    end

end
# Placing Ships
# The board should be able to place a ship in its cells. Because a Ship occupies more than one cell, 
# multiple Cells will contain the same ship. This is a little brain bendy at first, 
# but it is a very important concept. This is Object Oriented Programming in a nutshell.