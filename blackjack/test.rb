#make a = 11 unless total of hand > 21

#make letters = 10

#
# def player
#   j, q, k, a = 10, 10, 10, 11
#   hand = a + a
#   if hand == 21
#     puts "you win"
#   elsif hand < 21
#     puts "would you like to hit again"
#
#   else
#     puts "you lost"
#   end
# end
# player





# a = 11
# cardnum = [2, 3, 4, 5, 6, 7, 8, 9, 10, a]
# def totalhand(cardnum)
#   total = 0
#   cardnum.each do |n|
#     total += n
#   end
#   total
# end
# puts totalhand(cardnum)
# #
#
# if totalhand < 21
#   a = 11
# else
#   a = 1
# end
#
# puts a
# numbers = 2..10
# def imperative_sum(numbers)
#   total = 0
#   numbers.each do |n|
#     total += n
#   end
#   total
# end
# puts imperative_sum(numbers)

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
