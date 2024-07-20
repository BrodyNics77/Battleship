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

    def render
        if @hit == false
            return "."
        else
            return "M"
        end
    end
end

#def render(reveal = false)
 #   if @fired_upon
  #  if @ship
   # @ship.sunk? ? "X" : "H"
   # else
   # "M"
   # end
   # elsif reveal && @ship"S"
   # else"."
   # end
   # end