
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
  @house.reduce(:+)

  end

  def bets
    new_num = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11]
    @gambler = new_num.sample(2)
    @gambler.reduce(:+)
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
    puts "#{random} is the gambler hand"
    dealer_hand
  end
  def dealer_hand
    puts "#{bets} is dealers hand"
  end
  def winner
    bets
    random
    case
    when bets < random
      puts "dealer wins"
    when bets > random
      puts "player wins"
    when random > 21
      puts "dealer busted"
    when bets > 21
      puts "player busted"
    else
      puts "its a tie"
    end
  end
end


@deal = DealCard.new
