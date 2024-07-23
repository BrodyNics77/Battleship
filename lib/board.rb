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
# an enumerable can possibly help #place, by celling @cells/locations and putting in coordinates
# or
# were taking a number of coordintes, looking at 
    def place(ship, coordinates)
    return false if !valid_placement?(ship, coordinates)
        coordinates.each do |coordinate|
            @cells[coordinate].place_ship(ship)
        end
    end

    def valid_coordinate?(coordinate)
        @cells.key?(coordinate)
    end

    def valid_placement?(ship, coordinates)
        return false if !length_check?(ship, coordinates)
        return false if !unique_checker?(coordinates)
        return false if diagonal_checker?(coordinates)
        true
    end

    def length_check?(ship, coordinates)
        coordinates.length == ship.length
    end

    def unique_checker?(coordinates)
        letters = coordinates.map {|coordinate| coordinate[0]} 
        numbers = coordinates.map {|coordinate| coordinate[1]}
        if letters.uniq.count == 1
            consecutive_numbers?(coordinates)
        elsif numbers.uniq.count == 1
            consecutive_letters?(coordinates)
        else
            false
        end
    end

    def consecutive_numbers?(coordinates)
        numbers = coordinates.map {|coordinate| coordinate[1]}
        numbers.each_cons(2).all? do |num_1, num_2| 
            num_2.to_i == num_1.to_i + 1
        end
    end

    def consecutive_letters?(coordinates)
        letters = coordinates.map {|coordinate| coordinate[0]}
        letters.each_cons(2).all? do |a, b| 
            b.ord == a.ord + 1
        end
    end

    def diagonal_checker?(coordinates)
        if consecutive_letters?(coordinates) == true && consecutive_numbers?(coordinates) == true
            false
        end
    end

    def overlapping?(ship, coordinates)
        coordinates.any? do |coordinate|
            !@cells[coordinate].empty?
        end
    end
end
            # require'pry'; binding.pry
