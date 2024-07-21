class Board
    
    attr_reader :cells

    def initialize
        @cells = loc
    end

    def loc
        cells = {
            "A1" => @cell,
            "A2" => @cell,
            "A3" => @cell,
            "A4" => @cell,
            "B1" => @cell,
            "B2" => @cell,
            "B3" => @cell,
            "B4" => @cell,
            "C1" => @cell,
            "C2" => @cell,
            "C3" => @cell,
            "C4" => @cell,
            "D1" => @cell,
            "D2" => @cell,
            "D3" => @cell,
            "D4" => @cell,
        }
    end

    def valid_coordinate?(coordinate)
        @cells.key?(coordinate)
    end

end