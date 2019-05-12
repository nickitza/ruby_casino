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
  @numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
  @house = @numbers.sample(2)
  @dealercards = @house.reduce(:+)
  end
  def hit
    puts "your total is :#{@playercards}, dealers card is :#{@house.first}."
    puts "press 1 if you want to hit?"
    puts "press 2 if you want to stay"
    take_hit = gets.to_i
    case take_hit
    when 1
      @the_hit = @numbers.sample(1)
      @the_hit << @playercards
      # binding.pry
      @hit_total = @the_hit.reduce(:+)

      puts "you new total is #{@hit_total}"
    when 2
      winner
    else
      puts "you stayed with #{@playercards}"
    end
    hit_till_quit
  end
    def hit_till_quit
      if @hit_total > 21
        hit
      else
        winner
    end
  end
  def bets
    new_num = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
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
    puts "your cards are #{@gambler}"
    sleep(0.5)
    hit
    dealer_hand
  end
  def dealer_hand
    puts "dealers cards are #{@house} his total is #{@dealercards}"
    sleep(0.5)
  end
  def winner

    case
    when @dealercards > 21
      puts "dealer busted"
    when @playercards < @dealercards
      puts "dealer wins"
    when @playercards > @dealercards
      puts "player wins"
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
