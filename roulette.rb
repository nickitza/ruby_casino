require "pry"
require "colorize"
require_relative 'ruby_casino.rb'

class Roulette
  def initialize
    game_menu
  end
  def game_menu
    puts "------ROULETTE------"
    puts "Welcome #{@player}, you currently have $#{@wallet}"
    puts "Type 'help' at any time for rules"

    puts "How much money do you want to bet?"
    user_input = gets.strip
    if user_input.downcase == 'help'
      help_menu
    else place_bet(user_input)
    end
  end

  def help_menu
    
  end

  def place_bet(bet)
    puts "Options"
    puts "1) List of available bets/help"
    puts "2) Play"
    user_input = gets.to_i
    case user_input
     when 1
      help_menu
     when 2

    end

  end

end

Roulette.new