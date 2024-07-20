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

    it 'has cells stored in a hash' do
        expect(@board.cells).to be_a(Hash)
    end

    it 'has a total of 16 key/value pairs in the hash' do
        @board.cells

        expect(@board.cells).to eq()
    end

    it 'has the cells keys as coordinate strings' do
        @board.cells

    end

    it 'has the values as cell objects' do
        @board.cells

    end


end
# The Board class is responsible for keeping track of cells, 
# validating coordinates, validating ship placements, placing ships, 
# and rendering a visual representation of itself.