require 'pry'

require './cards.rb'
require './aces.rb'
deck = Deck.new

class BlackJack


  def initialize
    game
  end
    def game



      if @hand == 21
      puts "you win"
    else
       @hand < 21
      puts "1) would you like to hit again"
    end
      input = gets.strip
      case input
      when 1
        hit
    else
      puts "you lost"
    end
  end
end



BlackJack.new
