require "pry"
require "colorize"
# require_relative 'ruby_casino'

class Roulette
  def initialize
    # attr_accessor 
    @wallet = 100
    # @roulette_wheel_colors = ["red", "black"]
    # @roulette_wheel_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 28, 30, 31, 32, 33, 34, 34, 35]
    @roulette_wheel_hash = [{0 => "green"},{ 0.0 => "green"}, {1 => "red"},
      {2 => "black"}, {3 => "red"}, {4 => "black"}, {5 => "red"},
      {6 => "black"}, {7 => "red"}, {8 => "black"}, {9 => "red"}, 
      {10 => "black"}, {11 => "red"}, {12 => "black"}, {13 => "red"}, 
      {14 => "black"}, {15 => "red"}, {16 => "black"}, {17 => "red"},
      {18 => "black"}, {19 => "red"}, {20 => "black"}, {21 => "red"},
      {22 => "black"}, {23 => "red"}, {24 => "black"}, {25 => "red"}, 
      {26 => "black"}, {27 => "red"}, {28 => "black"}, {29 => "red"}, 
      {30 => "black"}, {31 => "red"}, {32 => "black"}, {33 => "red"}, 
      {34 => "black"}, {35 => "red"}, {36 => "black"},
    ]
    game_menu
  end
  def game_menu
    puts "------ROULETTE------"
    puts "Welcome #{@player}, you currently have $#{@wallet}"
    puts "Type 'help' at any time for rules"
    puts "type 'play' to start playing."
    prompt
    user_input = gets.strip
    user_input.downcase == "help" ? help_menu : place_bet
  end
  
  def help_menu
    puts "This is the help menu, type 'quit' to return to game."
    user_input = gets.strip
    user_input == "quit" ? place_bet : nil
  end
  
  def place_bet
    # print `clear`
    puts "You currently have $#{@wallet}. How much money do you want to bet?"
    #ADD VIEW WALLET CHOICE HERE
    user_bet = gets.strip
    user_bet == 'help' ? help_menu : nil
    if user_bet.to_i > @wallet
      puts "You don't have enough money for that bet"
      help_menu
    end
    @wallet -= user_bet.to_i
    game_play(user_bet.to_i)
    
  end

  def game_play(bet)
    puts "What odds do you want to play?"
    puts "1) 35:1 - 0 or 00"
    puts "2) 35:1 - Straight up"
    puts "3) 17:1 - Row (0, 00)"
    puts "4) 17:1 - Split"
    puts "5) 11:1 - Street"
    puts "6) 8:1 - Corner"
    puts "7) 6:1 - Top Line or Basket"
    puts "8) 2:1 - Dozens"
    puts "9) 2:1 - Column"
    puts "10) 1:1 - Colors / Even or Odd"
    puts "11) 1:1 - 1 to 18 or 19 to 36"
    prompt
    user_choice = gets.strip
    case user_choice.to_i
    when 1 #35:1, betting on 0 or 00
      spin_wheel
      zero(bet)
    when 2 #35:1, BETTING ON A SINGLE NUMBER
      spin_wheel
      straight_up(bet)
    when 3 #17:1, BETTING ON 0 OR 00
      spin_wheel
      row(bet)
    when 4 #17:1 ANY TWO ADJOINING NUMBERS (EITHER BE +/-1 OR +/- 3 AWAY)
      spin_wheel
      split(bet)
    when 5 # 11:1, ANY THREE HORIZONTAL NUMBERS (1, 2, 3) (4, 5, 6)
      spin_wheel
      street(bet)
    when 8 #2:1, BETTING ON A 
      spin_wheel
      column(bet)
      
    end
    #REPEAT BET HERE?
  end
  
  # PAYOUT METHODS
  def zero(bet)
    puts "What are you betting on? '0' or '00'?"
    prompt
    user_number = gets.to_s
    #wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    if @ball_landed.keys[0] == user_number
      puts "YOU WIN"
      payout = (bet * 36) + bet
      puts "PAYOUT: $#{payout}"
      @wallet += payout
    else
      puts "You lose"
    end
    place_bet
  end
  
  def straight_up(bet)
    puts "What number are you betting on?"
    prompt
    user_number = gets.to_i
    #wheel_spinning
    puts "You are betting $#{bet} on #{user_number}"
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    if @ball_landed.keys[0] == user_number
      puts "YOU WIN"
      payout = (bet * 35) + bet
      puts "PAYOUT: $#{payout}"
      @wallet += payout
    else
      puts "You lose"
    end
    place_bet
  end
  
  def row(bet)
    puts "You are betting $#{bet} on 0 or 00"
    #wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    if @ball_landed.keys[0] == (0) || @ball_landed.keys[0] == 0.0
      payout = (bet * 17) + bet
      puts "YOU WIN"
      puts "PAYOUT: $#{payout}"
      @wallet += payout
    else
      puts "You lose"
    end
    place_bet
  end

  # def split(bet)
  #   puts "What two numbers are you splitting?"
  #   puts "Numbers must be between 1 and 36 and either split by 1, or 3"
  #   user_number = gets.strip
  #   user_arr = user_number.split(/\D\b/).map!(&:to_i)
  #   if (user_arr.max - user_arr.min != 1) || (user_arr.max - user_arr.min != 3)
  #     THIS IS ALWAYS HAPPENING
  #     binding.pry
  #     split(bet)
  #   else
  #     puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
  #     if user_arr.include?(ball_landed.keys[0])
  #       payout = (bet * 17) + bet
  #     puts "YOU WIN"
  #     puts "PAYOUT: $#{payout}"
  #     @wallet += payout
  #     else
  #     puts "You lose"
  #     end
  #   end
  #   place_bet
  # end
    
  def street(bet)
    rows = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12], [13, 14, 15], [16, 17, 18], [19, 20, 21], [22, 23, 24], [25, 26, 27], [28, 29, 30], [31, 32, 33], [34, 35, 36]]
    puts "Which street are you betting on?"
    puts "1) Street 1: #{rows[0]}"
    puts "2) Street 2: #{rows[1]}"
    puts "3) Street 3: #{rows[2]}"
    puts "4) Street 4: #{rows[3]}"
    puts "5) Street 5: #{rows[4]}"
    puts "6) Street 6: #{rows[5]}"
    puts "7) Street 7: #{rows[6]}"
    puts "8) Street 8: #{rows[7]}"
    puts "9) Street 9: #{rows[8]}"
    puts "10) Street 10: #{rows[9]}"
    puts "11) Street 11: #{rows[10]}"
    puts "12) Street 12: #{rows[11]}"
    user_number = gets.to_i
    prompt
    puts "You are betting #{bet} on Street #{user_number}."
    #wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    if rows[user_number - 1].include?(@ball_landed.keys[0])
      payout = (bet * 11) + bet
      puts "YOU WIN"
      puts "PAYOUT: $#{payout}"
      @wallet += payout
    else
      puts "You lose"
    end
    place_bet
  end

  def column(bet, choice)
    col_1 = [1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34]
    col_2 = col_1.map{ |n| n + 1}
    col_3 = col_2.map{ |n| n + 1}
    puts "Which column are you betting on?"
    puts "1) Row 1:  #{col_1.join(', ')}"
    puts "2) Row 2:  #{col_2.join(', ')}"
    puts "3) Row 3:  #{col_3.join(', ')}"
    prompt
    user_number = gets.to_i
    puts "You are betting $#{bet} on Row #{user_number}"
    #wheel_spinning
    if user_number == 1
      user_number = col_1
    elsif user_number == 2
      user_number = col_2
    else user_number = col_3
    end
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    if user_number.include?(@ball_landed.keys[0])
      payout = (bet * 2) + bet
      puts "YOU WIN"
      puts "PAYOUT: $#{payout}"
      @wallet += payout
    else
      puts "You lose"
    end
    place_bet
  end
  
  #ROULETTE WHEEL
  def spin_wheel
    ball_landed_on = @roulette_wheel_hash.sample
    @ball_landed = ball_landed_on
  end
  #HELPER FORMATTING FUNCTIONS
  def prompt
    print "> "
  end
  
  def wheel_spinning
    x = 0
    while x < 10
      puts "~" *rand(0..10)
      sleep(1)
      x += 1
    end 
  end
  
end

Roulette.new