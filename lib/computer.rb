require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/art'

class Computer


    def initialize
        @computer_player = Board.new
        @player = Board.new
        @ship = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
        @cells = @computer_player.cells.keys
        
    end

    def start
        puts
        puts "\n------------------------------------------------"
        puts "         Welcome to Battleship Royale!"
        puts "------------------------------------------------"
        puts "\n------------------------------------------------"
        puts "         Enter p to play. Enter q to quit."
        puts "------------------------------------------------"
        
        answer = gets.chomp.downcase
        if answer.downcase == 'p'
            puts "Starting game..."
            puts @player.render
            computer_place
            game_setup

        elsif answer.downcase == 'q'
            puts "Shuttin it down, cap'n"
        end
    end
    
    def computer_place        
        good_coords = column_placement(@ship[0])
        @computer_player.place(@ship[0], good_coords)
        # require 'pry';binding.pry
    end
# using helper methods 3-3 ==0
    def game_setup
        puts "Where would you like to place your Cruiser (3 spaces)?"
        puts "Enter your first coordinate between A1 through D4"
        answer = gets.chomp.upcase
        cruiser_placement = []
        @ship[0]
        @player.place(@ship[0], cruiser_placement)
        cruiser_placement << answer
    end

    def column_placement(ship)
        column = true
        while column
            good_coords = column_placement_math(ship, @cells.sample)
            if good_coords
                return good_coords
            end
        end
    end

    def column_placement_math(ship, coordinate)
        letter = coordinate[0].ord
        start_letter = letter - ship.length
        if letter - ship.length >= 63
            beginning_letter = (start_letter + 1).chr
            coordinates_rows = (beginning_letter..coordinate[0]).to_a.map do |row|
                "#{row}#{coordinate[1]}"
            end
            return coordinates_rows
        end
        false
    end
#  1 2 3 4 
# A . . . . 
# B . . . . 
# C . . . . 
# D . . . . 


end
