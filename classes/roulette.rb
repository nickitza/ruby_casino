#WALLET NEEDS TO SYNC WITH CASINO
#HELP MENU MOD/UPDATE
#
#
#BETS PLACED AND MONEY WON?

require "pry"
require "colorize"
require "sounder"
# require_relative "ruby_casino.rb"

class Roulette
  attr_accessor :roulette_wallet
  
  def initialize(wallet)
    @bets_placed = 0
    @wallet = wallet
    @ball_history = []
    @roulette_wheel_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 28, 30, 31, 32, 33, 34, 35, 36]
    @roulette_wheel_hash = [{0 => "green"},{ 0.0 => "green"}, {1 => "red"},
      {2 => "black"}, {3 => "red"},{4 => "black"}, {5 => "red"},
      {6 => "black"}, {7 => "red"}, {8 => "black"}, {9 => "red"}, 
      {10 => "black"}, {11 => "black"}, {12 => "red"}, {13 => "black"}, 
      {14 => "red"}, {15 => "black"}, {16 => "red"}, {17 => "black"},
      {18 => "red"}, {19 => "red"}, {20 => "black"}, {21 => "red"},
      {22 => "black"}, {23 => "red"}, {24 => "black"}, {25 => "red"}, 
      {26 => "black"}, {27 => "red"}, {28 => "black"}, {29 => "black"}, 
      {30 => "red"}, {31 => "black"}, {32 => "red"}, {33 => "black"}, 
      {34 => "red"}, {35 => "black"}, {36 => "red"},
    ]
    game_menu
  end
  def game_menu
    puts "------ROULETTE------"
    puts "Welcome #{@player}, you currently have $#{$wallet}"
    puts "Type 'help' at any time for rules"
    puts "type 'play' to start playing."
    puts "Type 'quit' to return to the Casino Manu"
    puts
    prompt
    binding.pry
    user_input = gets.strip
    exit_functions(user_input)
    place_bet
  end
  
  def help_menu
    puts "This is the help menu, type 'quit' to return to game."
    puts "--Follow on-screen instructions"
    puts "--Type 'quit' anytime before a bet is placed to return to the Casino"
    puts "--Type '************************************' if you need to add more money to your wallet"

    user_input = gets.strip
    user_input == "quit" ? place_bet : help_menu
  end
  
  def place_bet
    # print `clear`
    @bets_placed += 1
    puts "Enter 'view' to see ball history. 'help' for help menu"
    puts
    puts "You currently have $#{@wallet}."
    puts
    puts "How much money do you want to bet?"
    puts
    #ADD VIEW WALLET CHOICE HERE
    prompt
    user_bet = gets.strip
    exit_functions(user_bet)
    if user_bet.to_i > @wallet
      puts "You don't have enough money for that bet"
      help_menu
    end
    @wallet -= user_bet.to_i
    game_play(user_bet.to_i)
  end
  def game_play(bet)
    print `clear`
    puts "What odds do you want to play?"
    puts "1) 35:1 - 0 or 00"
    puts "2) 35:1 - Straight up"
    puts "3) 17:1 - Row (0, 00)"
    puts "4) 17:1 - Split"
    puts "5) 11:1 - Street"
    puts "6) 6:1 - Top Line or Basket"
    puts "7) 2:1 - Dozens"
    puts "8) 2:1 - Column"
    puts "9) 1:1 - Colors, Even or Odd, 1 to 18 or 19 to 36"
    puts
    prompt
    user_choice = gets.strip
    exit_functions(user_choice)
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
    when 6 #6:1, TOP LINE OR BASKET (0, 00, 1, 2, 3)
      spin_wheel
      top_line(bet)
    when 7 #2:1, BETTING ON A COLUMN (12 NUMBERS)
      spin_wheel
      dozens(bet)
    when 8 # 2:1 DOZENS (1-12 etc...)
      spin_wheel
      column(bet)
    when 9 #1:1 bets (COLORS, EVENS, ODDS ETC...)
      spin_wheel
      one_to_one(bet)
    end
    #REPEAT BET HERE?
  end
  
  # PAYOUT METHODS
  def zero(bet)
    puts "Are you betting on '0' or '00'?"
    puts
    prompt
    user_number = gets.to_s
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    if @ball_landed.keys[0] == user_number
      payout = 36
      you_win(bet, payout)
    else
      puts "You lose"
    end
    place_bet
  end
  
  def straight_up(bet)
    puts "What number are you betting on?"
    puts
    prompt
    user_number = gets.to_i
    if user_number < 1 || user_number > 36
      puts "That is not a valid bet. Please enter a number between 1 and 36"
      puts
      straight_up(bet)
    end
    puts "You are betting $#{bet} on #{user_number}"
    puts
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    puts
    if @ball_landed.keys[0] == user_number
      payout = 35
      you_win(bet, payout)
    else
      puts "You lose"
    end
    place_bet
  end
  
  def row(bet)
    puts "You are betting $#{bet} on 0 or 00"
    puts
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    puts
    if @ball_landed.keys[0] == (0) || @ball_landed.keys[0] == 0.0
      payout = 17
      you_win(bet, payout)
    else
      puts "You lose"
    end
    place_bet
  end
  
  def split(bet)
    puts "What two numbers are you splitting?"
    puts "Numbers must be between 1 and 36 and either split by 1, or 3"
    puts
    prompt
    user_number = gets.strip
    user_arr = user_number.split(/\D\b/).map!(&:to_i)
    puts "You are betting $#{bet} on #{user_arr[0]} and #{user_arr[1]}"
    puts
    wheel_spinning
    if (user_arr.max - user_arr.min == 1) || (user_arr.max - user_arr.min == 3)
      puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
      if user_arr.include?(@ball_landed.keys[0])
        payout = 17
        you_win(bet, payout)
      else
        puts "You lose"
      end
    else
      split(bet)
    end
    place_bet
  end
  
  def street(bet)
    rows = @roulette_wheel_numbers.each_slice(3).to_a
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
    puts
    prompt
    user_number = gets.to_i
    puts "You are betting #{bet} on Street #{user_number}."
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    if rows[user_number - 1].include?(@ball_landed.keys[0])
      payout = 11
      you_win(bet, payout)
    else
      puts "You lose"
    end
    place_bet
  end
  
  def top_line(bet)
    puts "You are betting #{bet} on the Top Line (0, 00, 1, 2, 3.)"
    puts
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    puts
    if [0, 0.0, 1, 2, 3].include?(@ball_landed.keys[0])
      payout = 2
      you_win(bet, payout)
    else
      puts "You lose"
    end
    place_bet
  end
  
  def column(bet)
    columns = [(1 - 1).step(@roulette_wheel_numbers.size - 1, 3).map { |i| @roulette_wheel_numbers[i] }, 
    (2 - 1).step(@roulette_wheel_numbers.size - 1, 3).map { |i| @roulette_wheel_numbers[i] },
    (3 - 1).step(@roulette_wheel_numbers.size - 1, 3).map { |i| @roulette_wheel_numbers[i] } ]
    puts "Which column are you betting on?"
    puts "1) Row 1:  #{columns[0]}"
    puts "2) Row 2:  #{columns[1]}"
    puts "3) Row 3:  #{columns[2]}"
    puts
    prompt
    user_number = gets.to_i
    puts "You are betting $#{bet} on Row #{columns[user_number - 1]}"
    puts
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    puts
    if columns[user_number - 1].include?(@ball_landed.keys[0])
      payout = 2
      you_win(bet, payout)
      payout = (bet * 2) + bet
      puts "YOU WIN"
      puts "PAYOUT: $#{payout}"
      @wallet += payout
    else
      puts "You lose"
    end
    place_bet
  end
  
  def dozens(bet)
    dozen = @roulette_wheel_numbers.each_slice(12).to_a
    puts "Which dozen are you betting on?"
    puts "1) First dozen, 1 - 12"
    puts "2) Second dozen, 13-24"
    puts "3) Third dozen, 25-36"
    puts
    prompt
    user_number = gets.to_i
    puts "You are betting $#{bet} on dozen #{user_number}"
    puts
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    puts
    if dozen[user_number - 1].include?(@ball_landed.keys[0])
      payout = (bet * 2) + bet
      puts "YOU WIN"
      puts "PAYOUT: $#{payout}"
      @wallet += payout
    else
      puts "You lose"
    end
    place_bet
    
  end
  
  def one_to_one(bet)
    puts "Which 1:1 bet do you want to place?"
    puts "1) Even/Odd"
    puts "2) Red/Black"
    puts "3) 1 to 18/19 to 36"
    puts
    prompt
    user_input = gets.to_i
    case user_input
    when 1
      even_odd(bet)
    when 2
      red_black(bet)
    else
      half_board(bet)
    end
  end 
  
  def even_odd(bet)
    puts "1) Even"
    puts "2) Odd"
    puts
    prompt
    user_input = gets.to_i
    choice = ["even", "odd"]
    puts "You are betting #{bet} on #{choice[user_input - 1]}"
    puts
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    puts
    if user_input == 1 && @ball_landed.keys[0].even?
      payout = 1
      you_win(bet, payout)
    elsif user_input == 2 && (@ball_landed.keys[0].even? == false)
      payout = 1
      you_win(bet, payout)
    else
      puts "You lose"
    end
    place_bet
  end
  
  def red_black(bet)
    puts "1) Red"
    puts "2) Black"
    puts
    prompt
    user_input = gets.to_i
    choice = ["red", "black"]
    puts "You are betting #{bet} on #{choice[user_input - 1]}"
    puts
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    puts
    if user_input == 1 && (@ball_landed.values[0] == "red")
      payout = 1
      you_win(bet,payout)
    elsif user_input == 2 && (@ball_landed.values[0] == "black")
      payout = 1
      you_win(bet, payout)
    else
      puts "You lose"
    end
    place_bet
  end
  
  def half_board(bet)
    puts "1) 1 through 18"
    puts "2) 19 through 36"
    puts
    prompt
    user_input = gets.to_i
    range = @roulette_wheel_numbers.each_slice(18).to_a
    puts "You are betting #{bet} on #{range[user_input - 1]}"
    puts
    wheel_spinning
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    puts
    if range[user_input - 1].include?(@ball_landed.keys[0])
      payout = 1
      you_win(bet, payout)
    else
      puts "You lose"
    end
    place_bet
  end
  
  def you_win(bet, payout)
    puts "YOU WIN"
    payout = (bet * payout) + bet
    puts "PAYOUT: $#{payout}"
    puts
    @wallet += payout
  end
  
  #ROULETTE WHEEL
  def spin_wheel
    ball_landed_on = @roulette_wheel_hash.sample
    @ball_history << ball_landed_on
    @ball_landed = ball_landed_on
  end
  
  def view_history
    puts `clear`
    @ball_history.each.with_index do |result, i| 
      puts "#{i + 1}) #{result.keys[0]} #{result.values[0]}".colorize(:"#{result.values[0]}")
    end
    sleep(3)
    place_bet
  end
  
  #HELPER FORMATTING FUNCTIONS
  def prompt
    print "> ".colorize(:red)
  end
  
  def wheel_spinning
    x = 0
    while x < 10
      print "~" *rand(0..10)
      sleep(0.2)
      x += 1
    end 
    puts
  end

  def exit_functions(user_input)
      user_input == 'view' ? view_history : nil
      user_input == 'help' ? help_menu : nil
      user_input == 'quit' ? Casino.new(@wallet) : nil
    end
end

# Roulette.new(100)