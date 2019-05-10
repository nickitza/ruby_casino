require './cards.rb'

#make aces = 11 or 1


# give ability to hit.

j, q, k, a = 10, 10, 10, 11

class BlackJack
  def initialize
    start_game
  end
  def start_game
    puts "would you like to play(y/n)"
    input = gets.to_s
    case input
    when "y"
      puts "lets start"
    when "n"
      puts "no"
    else
      puts "invalid"
    end
  end
end
BlackJack.new
