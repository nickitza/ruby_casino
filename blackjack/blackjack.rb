require 'pry'
require './cards.rb'
require './aces.rb'
deck = Deck.new
#whats done,
#can draw cards from a Deck
#can issue 2 hands 


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

 @deal = DealCard.new


class Round < DealCard
  def initialize
    playing
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
    puts random + random2
    dealer_hand
  end
  def dealer_hand
    puts "#{random + random2} is dealers hand"
  end
end

round = Round.new
