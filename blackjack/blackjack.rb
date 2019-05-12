require 'pry'
# require './cards.rb'
# # require './aces.rb'
# require './wallet.rb'
# Deck.new
#
# Wallet.new

class DealCard

  def initialize
  random
  bets
  playing
  winner
  end
  def random
  numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11]
  @house = numbers.sample(2)
  @dealercards = @house.reduce(:+)

  end

  def bets
    new_num = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11]
    @gambler = new_num.sample(2)
    @playercards = @gambler.reduce(:+)
  end

  def playing
    puts "press 1, lets play"
    puts "press 2 to exit"
    input = gets.to_i
    case input
    when 1
      hand
    when 2
      exit
    end
  end
  def hand
    puts "#{@playercards} is the players hand"
    sleep(0.5)
    dealer_hand
  end
  def dealer_hand
    puts "#{@dealercards} is dealers hand"
    sleep(0.5)
  end
  def winner
    # binding.pry
    case
    when @playercards < @dealercards
      puts "dealer wins"
    when @playercards > @dealercards
      puts "player wins"
    when @dealercards > 21
      puts "dealer busted"
    when @playercards > 21
      puts "player busted"
    when @playercards == @dealercards
      puts "its a tie"
    else
      puts "else puts wierd"
    end
  end
end


@deal = DealCard.new
