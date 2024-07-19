class Cell

    attr_reader :coordinate, :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
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

    def fired_upon
        @ship.hit 
    end

    def fired_upon?
        if @ship.health == @ship.length
            false
        else true

        end
    end

    def render
        return "."
    end

   

end