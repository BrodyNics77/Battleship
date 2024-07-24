require './lib/helper'

cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)

ships=(cruiser, submarine)

cell = Cell.new

board = Board.new

def start
    
    p "Welcome to BATTLESHIP"
    puts "---------------------"
    p "\nEnter p to play. Enter q to quit"
    answer = gets.chomp().downcase


    # def start(deck)
    #     round = Round.new(deck)
    #     puts "Welcome! You're playing with #{deck.count} cards."
    #     puts "-------------------------------------------------"
    #     deck.count.times do
    #         puts "\nThis is card number #{round.turns.size + 1} out of #{deck.count}."
    #         puts round.current_card.question
    #         user_input = gets.chomp
    #         turn_taken = round.take_turn(user_input)
    #         puts turn_taken.feedback
    #     end
    #     puts "\n****** Game over! ******"
    #     puts "\nYou had #{round.number_correct.to_i} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
    #         categories = deck.cards.map do |category|
    #             category.category
    #         end
    #         categories.uniq.each do |category|
    #             puts "#{category} - #{round.percent_correct_by_category(category).to_i} % correct"
    #         end
    # end
    # start(deck)







# Needs to be built
# Would like to add an additional credit screen/prompt, also before -
# turn in need to fix the read me's. 
# Read me's need to be changed to decribe the actual project/game and instructions on how to play.