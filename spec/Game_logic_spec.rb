require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/Game_logic'

RSpec.configure do |config| 
    config.formatter = :documentation
    end

RSpec.describe 'Game_logic' do
    before(:each) do
        @Game_logic = Game_logic.new
    end

    describe "#initialize" do
        it '#initialze with a board and turn set to 0' do
            expect(@Game_logic.boar). to be_an_instance_of(Board)
            expect(@Game_logic.turn). to eq (0)
        end

        it 'Describes with a set of a ships' do
            expect(@Game_logic.ship.size). to eq (5)
            expect(@Game_logic.ships). to all (be_an_instance_of(Ship))
        end
    end

    describe '#computer place_ships' do
        it 'place ships on the board' do
            allow(@Game_logic).to receive(:generate_random_coordinates).and_return(['A1, A2'])
            allow(@Game_logic.board).to receive(:valid_placement).and_return(true)

            expect(@Game_logic). to receive(:place).excatly(@Game_logic.ship.size).times
            game_logic.place_ship
        end
    end

    describe '#computer_turn' do
        let(opponent_board) {Board.new}

        it 'fires at enemy board' do
            allow(Game_logic).to receive(:generate_random_shot).and_return("A1")

            expect(opponent_board.cell["A1"]).to receive(:fire_upon)
            game_logic.computer_turn(opponent_board)
        end
    end
    describe '#generate_random_coordinates' do
         it 'generates valid random coordinates' do
            coordinates = game_logic.send(:generate_random_coordinates, 2)

            expect(coordinates.size).to eq(2)
            expect(coordinates).to all(be_a(String))
            expect(coordinates).to all(match(/^[A-D][1-4]$/))
    end
  end

    describe '#generate_random_shot' do
        let (:opponent_board) {Board.new}

         it 'generates valid random shot coordinates' do
              coordinate = game_logic.send(generate_random_coordinates, opponent_board)
            
              expect(coordinate).to be_a(String)
              expect(coordinate).to match(/^[A-D][1-4]$/)
         end
    end
end


# Need to build a computer to play against, and maybe a turn function?
# have some test set up, needs to be filled out