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
            "D4" => Cell.new('D4')
        }
    end

    def valid_coordinate?(coordinate)
        @cells.key?(coordinate)
    end

    def valid_placement?(ship, coordinates)
        return false if !length_check?(ship, coordinates)
        return false if !consecutive_checker(coordinates)
        true

    end
       
    def length_check?(ship, coordinates)
        coordinates.length == ship.length

    end

    def consecutive_checker(coordinates)
        letters = coordinates.map {|coordinate| coordinate[0]} 
        numbers = coordinates.map {|coordinate| coordinate[1]}

        if letters.uniq.count == 1
            true
        elsif numbers.uniq.count == 1
            true
        else
            false
        end
    end
            

end