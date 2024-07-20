class Cell

    attr_reader :coordinate, :ship, :hit

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @hit = false
    end

    def empty?
        if @ship == nil
            true
        else false
        end
    end

    def place_ship(ship)
        @ship = ship
    end

    def fire_upon 
        if empty? == true
            @hit = true
        else
            @ship.hit
            @hit = true
        end
    end

    def fired_upon?
        if @ship.health == @ship.length
        false
        else true
        end
    end

    def render(reveal = false)
        if reveal == true
            return "S"
        end
        if @hit == false
            "."

        elsif place_ship(@ship)
            @ship.hit
            @ship.hit == true && @ship.sunk? == false
            "H"

        elsif place_ship(@ship)
            @ship.hit
            @ship.sunk? == true && @ship.hit == true
            "X"

        else
            return "M"
        end
     end

end