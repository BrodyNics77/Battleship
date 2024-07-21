class Board
    
    attr_reader :cells

    def initialize
        @cells = location
    end

    def location
        loc = {
            "A1" => Cell.new('A1'),
            "A2" => Cell.new('A2'),
            "A3" => Cell.new('A3'),
            "A4" => Cell.new('A4'),
            "B1" => Cell.new('B1'),
            "B2" => Cell.new('B2'),
            "B3" => Cell.new('B3'),
            "B4" => Cell.new('B4'),
            "C1" => Cell.new('C1'),
            "C2" => Cell.new('C2'),
            "C3" => Cell.new('C3'),
            "C4" => Cell.new('C4'),
            "D1" => Cell.new('D1'),
            "D2" => Cell.new('D2'),
            "D3" => Cell.new('D3'),
            "D4" => Cell.new('D4'),
        }
    end

    def valid_coordinate?(coordinate)
        @cells.key?(coordinate)
    end

    def valid_placement?(ship, coordinates)
        if coordinates.length != ship.length
            return false
        end
        
        (1..4).each_cons(3) { |a| p a }
        coord_letters = ["A", "B", "C", "D"]
        coord__nums = ["1", "2", "3", "4"]
        if 

        end
    end
#range of the ship in the grid must be each consecutive
# numbers can all be the same and letters can increment
# each cons goes through range and goes through all the possible spots it will fit.
# seperate coordinates into 2 arrays.  check if sequential/uniq
end