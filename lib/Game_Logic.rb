class Game_logic

    attr_reader :computer, :turn

    def initialize(computer)
        @computer = computer
        @turn = 0
        @ship = [
            Ship.new('Cruiser, 3')
            Ship.new('Submarine, 3')
        ]
    end

    def computer
        place_ships
    end

    def computer_place(ship, coordintes, cell)
        ship = @computer.place_ships
        ships.each do |ship|
            placed = false
            until placed
                coordintes = generate_random_coordinates(ship.length)
                if board.valid_placement?(ship, coordinate)
                    board.place
                end
            end
        end
    end

    def computer_turn(opponent_board)
        coordinate = generate_random_shot(opponent_board)
        opponent_board.cell[coordinates].fire_upon
    end

    def generate_random_shot
        coordinate = []
        direction = [:horizontal, :vertical].sample

        if direction == :horizontal
            start_col.upto(start_col + length -1) do |col|
                coordinate << '#{start_row}#{col}'
            end
        else
            start_row.ord.upto(start_row.ord + length - 1) do |row|
                coordinate << '#{row.chr}#{start_col}'
            end
        end
        coordinate
    end

    def generate_random_shot(opponent_board)
        loop do
            row = ('A'..'D'). to_a.sample
            col = (1 ..4).to_a.sample
            coordinate = "#{row}#{col}"
            return coordinates unless opponent_board.cells[coordinates].fired_upon?
        end
    end
end

#crazy script my friends told me, idk how to test or fully how it works
#def computer_place(ship, coordintes, cell)
# ship = @computer.place_ships
#ships.each do |ship|
 #   placed = false
  #  until placed
   #     coordintes = generate_random_coordinates(ship.length)
    #    if board.valid_placement?(ship, coordnitates)
    #      board.place(ship, coordinates)
    #      place = true
         #end
        #end
    #end
# end
# end
# In testing building stage

