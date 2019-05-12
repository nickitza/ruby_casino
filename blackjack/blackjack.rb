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
case
when @dealercards <= 15

    @house_hit = @numbers.sample(1)
    @dealer_after_hit = @house.concat(@house_hit)
    @dealer_total = @dealer_after_hit.reduce(:+) ||  @dealercard.reduce(:+)
    binding.pry
end
  end
  def hit
    puts "your total is :#{@playercards.reduce(:+)}, dealers card is :#{@house.first}."
    puts "press 1 if you want to hit?"
    puts "press 2 if you want to stay"
    take_hit = gets.to_i
    case take_hit
    when 1
      @the_hit = @numbers.sample(1)
     @playercards.concat(@the_hit)
      @hit_total = @playercards.reduce(:+)
      puts "the card you drew is #{@the_hit}"
      puts "you new total is #{@playercards.reduce(:+)}"
    when 2
      winner
      puts "you stayed with #{@playercards}"
    else
      puts "test"
    end
    hit_till_quit
  end
    def hit_till_quit
      case @hit_total < 21
      when 1
        hit || winner
      else @hit_total > 21
        winner
    end
  end
  def bets
    new_num = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    @playercards = new_num.sample(2)

  end

  def playing
    puts "press 1, lets play"
    puts "press 2 to find another game at the casino"
    input = gets.to_i
    case input
    when 1
      hand
    when 2
      exit
    end
  end
  def hand
    puts "your cards are #{@playercards}"
    sleep(0.5)
    hit
    dealer_hand
  end
  def dealer_hand
    puts "dealers cards are #{@dealer_after_hit}"
    sleep(0.5)
  end
  def winner
    puts "the dealers total is #{@dealer_total || @dealercards}"
    win_num = 21
    case
    when @dealer_total > win_num
      puts "dealer busted"
    when @hit_total > win_num
      binding.pry
      puts "player busted"
    when @hit_total < @dealer_total
      puts "dealer wins"
    when @hit_total > @dealer_total
      puts "player wins"
    when @hit_total == @dealer_total
      puts "its a tie"
    else
      puts "wierd"
    end
  end
end


# @deal = DealCard.new
