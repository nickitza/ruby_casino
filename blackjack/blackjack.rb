require './cards.rb'
require './aces.rb'





class BlackJack
  def initialize
    player
  end
  def player
    hand = 11 + 11
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
