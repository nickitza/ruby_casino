require 'pry'

require './cards.rb'
require './aces.rb'
deck = Deck.new

class BlackJack
  def initialize
    game
  end
    def game
      puts "press 1 to play a hand"
      input = gets.to_i
      case input
        @hand = DealCard
      when @hand > 21
      puts "bust"
      when
       @hand < 21
      puts "1) would you like to hit again"
      input = gets.strip
    else @hand == 21
    rescue
      puts "you win"
    end
      case input
      when 1
        hit
    else
      puts "you lost"
      end
  end
end

class DealCard

  def initialize
  random
  end

  def random
  numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11]
  numbers[rand(numbers.count)]

  end

  def random2
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11]
  numbers[rand(numbers.count)]

  end
end

 deal = DealCard.new.random + DealCard.new.random2


BlackJack.new
