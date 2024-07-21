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
    
        it '#cells have key/val pair as coordinate strings' do
            expect(@board.valid_coordinate?("A1")).to be true
            expect(@board.valid_coordinate?("D1")).to be true
            expect(@board.valid_coordinate?("A5")).to be false
            expect(@board.valid_coordinate?("E1")).to be false
            expect(@board.valid_coordinate?("A22")).to be false
        end        
    end

    describe 'validating ship placements' do
        it '#valid_placement? test for false values of a ships length' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.length_check?(cruiser, ["A1", "A2"])).to be false
            expect(@board.length_check?(submarine, ["A2", "A3", "A4"])).to be false
        end

        it '#valid_placement? test for false values of a ships length' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to be false
            expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
        end

        it '#valid_placement? test for true values of ship length' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
            expect(@board.valid_placement?(submarine, ["A2", "A3"])).to be true
        end

        xit '#valid_placement? of consecutive coordinates' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
            expect(@board.valid_placement?(submarine, ["A1", "C1"])).to be false
            expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
            expect(@board.valid_placement?(submarine, ["C1", "B1"])).to be false
        end

        xit '#valid_placement? coordinates cannot go diagonal' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["A1", "B2", "C4"])).to be false
            expect(@board.valid_placement?(submarine, ["C2", "D3"])).to be false
        end

        xit '#valid_placement? should be true' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
            expect(@board.valid_placement?(submarine, ["A1", "A2"])).to be true
        end
    end

    describe 'placing ships' do
        xit '#place ship on coordinates' do
            cruiser = Ship.new("Cruiser", 3)
            board.place(cruiser, ["A1", "A2", "A3"])

            cell_1 = board.cells["A1"]
            cell_2 = board.cells["A2"]
            cell_3 = board.cells["A3"]

            cell_1.ship
            cell_2.ship
            cell_3.ship

            expect(cell_3.ship == cell_2.ship).to be true
        end

        xit '#valid_placement? ships cannot overlap' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2)

            board.place(cruiser, ["A1", "A2", "A3"])

            expect(@board.valid_placement?(submarine, ["A1", "B1"])).to be false
        end
    end

end
# The Board class is responsible for keeping track of cells, 
# validating coordinates, validating ship placements, placing ships, 
# and rendering a visual representation of itself.