require "pry"
require "colorize"
# require_relative 'ruby_casino'

class Roulette
  def initialize
    # attr_accessor 
    @roulette_wheel_colors = ["red", "black"]
    @roulette_wheel_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 28, 30, 31, 32, 33, 34, 34, 35]
    @roulette_wheel_hash = [{1 => "red"}, {2 => "black"}, {3 => "red"}, {4 => "black"}, {5 => "red"},{6 => "black"}, {7 => "red"}, {8 => "black"}, {9 => "red"}, {10 => "black"}, {11 => "red"}, {12 => "black"}, {13 => "red"}, {14 => "black"}, {15 => "red"}, {16 => "black"}, {17 => "red"}, {18 => "black"}, {19 => "red"}, {20 => "black"}, {21 => "red"},{22 => "black"}, {23 => "red"}, {24 => "black"}, {25 => "red"}, {26 => "black"}, {27 => "red"}, {28 => "black"}, {29 => "red"}, {30 => "black"}, {31 => "red"}, {32 => "black"}, {33 => "red"}, {34 => "black"}, {35 => "red"}, {36 => "black"},
    ]
    #WILL WORK ON '0' AND '00 LATER'
    game_menu
  end
  def game_menu
    puts "------ROULETTE------"
    puts "Welcome #{@player}, you currently have $#{@wallet}"
    puts "Type 'help' at any time for rules"
    puts "type 'play' to start playing."
    prompt
    user_input = gets.strip
    user_input.downcase == "help" ? help_menu : place_bet
  end
  
  def help_menu
    puts "This is the help menu, type 'quit' to return to game."
    user_input = gets.strip
    user_input == "quit" ? place_bet : nil
  end
  
  def place_bet
    print `clear`
    puts "How much money do you want to bet?"
    user_bet = gets.strip
    user_bet == 'help' ? help_menu : nil
    # if user_bet.to_i > @wallet
    #   puts "You don't have enough money for that bet"
    #   help_menu
    # end
    game_play(user_bet)
    
  end

  def game_play(bet)
    puts "Where would you like to place your bet?"
    puts "1) Red"
    puts "2) Black"
    puts "3) Evens"
    puts "4) Odds"
    prompt
    user_choice = gets.strip
    case user_choice.to_i
    when 1
      puts "You are betting $#{bet} on Red"
      # wheel_spinning
      ball_landed
      binding.pry
      if ball_landed[0] == "black"
        puts "you lose"
      else 
        puts "you win"
        puts "Ball landed #{ball_landed.keys[0]}, #{ball_landed.values[0]}"
      end
      game_play(bet)
    end
    
  end
  
  #ROULETTE WHEEL
  
  def ball_landed
    ball_landed_on = @roulette_wheel_hash.sample
    ball_landed = ball_landed_on
  end
  
  
  #HELPER FORMATTING FUNCTIONS
  def prompt
    print "> "
  end

  def wheel_spinning
    x = 0
    while x < 10
    puts "~" *rand(0..10)
    sleep(1)
    x += 1
    end 
  end

end

Roulette.new