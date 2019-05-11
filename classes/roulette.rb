require "pry"
require "colorize"
require_relative "player"
require_relative '../ruby_casino'

class Roulette
  def initialize
    attr_accessor :roulette_wallet
    roulette_wallet = $wallet
  end
  def initialize
    @roulette_wheel_colors = ["red", "black"]
    @roulette_wheel_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 28, 30, 31, 32, 33, 34, 34, 35]
    #WILL WORK ON '0' AND '00 LATER'
    game_menu
  end
  def game_menu
    puts "------ROULETTE------"
    puts "Welcome #{@player}, you currently have $#{$wallet}"
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
    #CONDITIONAL NEEDED TO SEE IF USER HAS ENOUGH MONEY AND TAKE OUT OF WALLET
    if user_bet.to_i > $wallet
      puts "not enough moneh"
    end
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
      if is_black? == true
        puts "you lose"
        puts "Ball landed #{ball_landed}"
      else 
        puts "you win"
        puts "Ball landed #{ball_landed}"
      end
      game_play(bet)
      
    when 2
      puts "You are betting $#{bet} on Black"
      
    when 3
      puts "You are betting $#{bet} on Evens"
      
    when 4
      puts "You are betting $#{bet} on Odds"
      
    end

  end

  #ROULETTE WHEEL
  def is_even?
    @roulette_wheel_numbers.sample.even?
  end

  def is_black?
    @roulette_wheel_colors.sample == "black"
  end

  def ball_landed
    return @roulette_wheel_numbers.sample
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