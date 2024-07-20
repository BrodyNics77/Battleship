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

    it 'has a total of 16 key/value pairs in the hash' do
        @board.cells

        expect(@board.cells.size).to eq(16)
    end

    xit 'cells have key/val pair as coordinate strings' do
        @board.cells

        expect(@board.cells).to eq()
    end


end
# The Board class is responsible for keeping track of cells, 
# validating coordinates, validating ship placements, placing ships, 
# and rendering a visual representation of itself.