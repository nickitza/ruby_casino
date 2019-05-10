require './cards.rb'

#make aces = 11 or 1


# give ability to hit.


class BlackJack
  def initialize
    start_game
  end
  def player
    j, q, k, a = 10, 10, 10, 11
    hand = a + a
    if hand == 21
      puts "you win"
    elsif hand < 21
      puts "would you like to hit again"

    else
      puts "you lost"
    end
  end
end
BlackJack.new
