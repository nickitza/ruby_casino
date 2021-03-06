# ### Keno Rules 
# puts 
# "Choose 15 numbers between 1 and 80.
# And then wait for the house to draw 20 numbers. 
# If a certain number of your picks come up, you win. 
# You can choose how many 'races' you'd like to play with that 15 number set.
# Each race costs $1 and the typical ticket is 7 races ($7)."

# @keno_payout = [{1,1},{2,4},{3,6},{4,8},{6,10},{7,50},{8,500},
#     {9,1000},{10,5000},{11,8000},{12,10000},{13,15000},{14,20000},
#     {15,30000},{16,50000},{17,80000},{18,100000},{19,150000},{20,200000}]
require_relative 'player.rb'
require 'pry'
require 'colorize'

#binding.pry

# @keno_payout = [{index: 1, payout: 1},{index: 2, payout: 4},
#     {index: 3, payout: 6},{index: 4, payout: 8},{index: 6, payout: 10},
#     {index: 7, payout: 50},{index: 8, payout: 500}, {index: 9, payout: 1000},
#     {index: 10, payout: 5000},{index: 11, payout: 8000},
#     {index: 12, payout: 10000},{index: 13, payout: 15000},{index: 14, payout: 20000},
#     {index: 15, payout: 30000},{index: 16, payout: 50000},{index: 17, payout: 80000},
#     {index: 18, payout: 100000},{index: 19, payout: 150000},{index: 20, payout: 200000}]

@random_twenty = []
@random_fifteen = []

class Keno
    attr_accessor :keno_wallet, :Keno_payout
    def initialize #(wallet)
        #wallet = @wallet 
        #@wallet = wallet
        #keno_wallet = @wallet
        @keno_payout = [{index: 1, payout: 1},{index: 2, payout: 4},
            {index: 3, payout: 6},{index: 4, payout: 8},{index: 6, payout: 10},
            {index: 7, payout: 50},{index: 8, payout: 500}, {index: 9, payout: 1000},
            {index: 10, payout: 5000},{index: 11, payout: 8000},
            {index: 12, payout: 10000},{index: 13, payout: 15000},{index: 14, payout: 20000},
            {index: 15, payout: 30000},{index: 16, payout: 50000},{index: 17, payout: 80000},
            {index: 18, payout: 100000},{index: 19, payout: 150000},{index: 20, payout: 200000}]        
        # puts
        # puts "Welcome to keno!".colorize(:blue)
        # puts
        # puts
        # puts "The rules here are simple:".colorize(:blue)
        # sleep(0.5) 
        # puts
        # puts "You choose 15 numners between 1 and 80,".colorize(:yellow)
        # puts "and the casino choose 20 numbers between 1 and 80.".colorize(:yellow)
        # sleep(0.5) 
        # puts
        # print "The more numbers matching between our two sets,".colorize(:yellow)
        # print " the more you win.".colorize(:magenta)
        # sleep(0.5)
        # puts
        # puts
        # puts "You can choose how many 'races' you'd like to play with that same 15 number set.".colorize(:yellow)
        # print "Each race costs".colorize(:yellow)
        # print " $1".colorize(:magenta)
        # print " and the typical ticket is 7 races".colorize(:yellow)
        # print " ($7).".colorize(:magenta)
        # puts 
        # puts 
        # puts 
        # print "When you're comfortable with the rules and ready to continue press".colorize(:yellow)
        # print " ENTER".colorize(:blue)
        # puts 
        # puts "--------------------------------------------------------------------------------"
        # puts
        # next_v = gets.strip
        # Keno.player_draw
        Keno.main_menu
    end
    def self.main_menu 
        still_running = true
        #while still_running
          #Keno.clear
          puts
          #Keno.stars
          puts "Welcome to keno!".colorize(:blue)
          #stars
          puts
          puts
          puts "The rules here are simple:".colorize(:blue)
          sleep(0.5) 
          puts
          puts "You choose 15 numners between 1 and 80,".colorize(:yellow)
          puts "and the casino choose 20 numbers between 1 and 80.".colorize(:yellow)
          sleep(0.5) 
          puts
          print "The more numbers matching between our two sets,".colorize(:yellow)
          print " the more you win.".colorize(:magenta)
          sleep(0.5)
          puts
          puts
          puts "You can choose how many 'races' you'd like to play with that same 15 number set.".colorize(:yellow)
          print "Each race costs".colorize(:yellow)
          print " $1".colorize(:magenta)
          print " and the typical ticket is 7 races".colorize(:yellow)
          print " ($7).".colorize(:magenta)
          puts 
          puts 
          puts 
          print "When you're comfortable with the rules and ready to continue press".colorize(:yellow)
          print " ENTER".colorize(:blue)
          puts 
          puts "--------------------------------------------------------------------------------"
          puts
          next_v = gets.strip
          Keno.player_draw
        #end
    end

    def get_menu_choice
        puts "1) New Game"
        puts "2) Exit To Casino"
        gets.strip
    end

    def self.player_draw
        #binding.pry
        @random_fifteen = []
        puts "How many races would you like to play with your first 15-number draw?".colorize(:yellow)
        puts "* reminder each race $1, slate of 7 races $7".colorize(:yellow)
        @races_number = gets.strip.to_i
        15.times do
            # (1...15) do |a|
            #     rand(1...80)
            # #random_sample = rand(1...80)
            @random_fifteen << rand(1...80)
            #@random_fifteen << random_sample
        end
        puts "You're current draw is:".colorize(:yellow)
        puts "#{@random_fifteen}".colorize(:blue)
        puts "---------------------------------------------------------------------".colorize(:blue)
        Keno.dealer_draw 
    end

    def self.dealer_draw
        @random_twenty = []
        @payout = 0
        @payouts_round = []
        @current_payout = []
        @races_number.times do |i|
            @random_twenty = []
            20.times do
                # random_sample = rand(1...80)
                # @random_twenty << random_sample
                @random_twenty << rand(1...80)
            end
            puts
            puts
            print "Dealer's Draw ".colorize(:yellow)
            print "##{i + 1}:".colorize(:magenta)
            puts
            puts "#{@random_twenty}".colorize(:yellow)
            check_for_common = []
            check_for_common << (@random_fifteen & @random_twenty)
            check_for_common = check_for_common[0]
            length_common = check_for_common.length.to_i
            puts "Number of common elements = #{length_common}".colorize(:green)
            puts "#{check_for_common}".colorize(:green)
            @payouts_round << length_common
            Keno.dealer_payout
            @Keno_payout.each.with_index do |element, i|
                element.each do |value|
                    if value == length_common
                        element[:payout] = @current_payout
                        puts "current payout: #{@current_payout}"
                    end
                end
            end
            @payout = 0
            @keno_payout = [{index: 1, payout: 1},{index: 2, payout: 4},
                {index: 3, payout: 6},{index: 4, payout: 8},{index: 6, payout: 10},
                {index: 7, payout: 50},{index: 8, payout: 500}, {index: 9, payout: 1000},
                {index: 10, payout: 5000},{index: 11, payout: 8000},
                {index: 12, payout: 10000},{index: 13, payout: 15000},{index: 14, payout: 20000},
                {index: 15, payout: 30000},{index: 16, payout: 50000},{index: 17, payout: 80000},
                {index: 18, payout: 100000},{index: 19, payout: 150000},{index: 20, payout: 200000}]
            #puts "#{@keno_payout[:index].find_for(length_common)}"
            #@keno_payout.each do |element|
                if element[:index] == length_common
                    element[:index].find_for(length_common)
                    @payout += element[:payout]
                    puts "#{@current_payout}"
                    @current_payout << @payout
                end
            end
            puts "#{@current_payout}"
        end
    end
    
    def self.dealer_payout
        puts "#{@payouts_round}"
        @payouts_round.each do |a|
            @pay_add = 0
            @pay_add = @keno_payout[(a-1)] #[:payout][(a-1)]
            do_times = a.to_i
            do_times.times do b
                @keno_payout[:payout]
            @current_payout = []
            @current_payout << @pay_add
            puts "#{@current_payout}"
        @keno_payout.each do |a|
            puts "#{a}"
            if @keno_payout[:index] == length_common
                @current_payout += @keno_payout[:payout]
                puts "#{@current_payout}"
            end
        end
        end
    end


    def stars
        puts "**********".colorize(:blue) * 2
        puts "**********".colorize(:blue) * 2
    end

    def clear
        print `clear`
    end
    # puts "#{@random_fifteen}"
    # puts 
    # puts "#{@random_twenty}"
    #Casino.new(@wallet)
    #main_menu
end


Keno.new(0)
#Keno.player_draw

# puts "#{@random_fifteen}"
# puts 
# puts "#{@random_twenty}"

  
user_choice = get_menu_choice 
          case user_choice
            when "1"
              if @wallet <= 0
                puts 'Your wallet is empty.'
                puts "Press enter to go back to the Casino to get more money."
                gets
                Casino.new(@wallet)
              else
              #place_bet
              end
            when "2"
              Casino.new(@wallet)
              # still_running = false
            else
              clear
              stars
              puts "That is not a valid selection.".colorize(:red)
              puts "Please choose either 1 or 2.".colorize(:red)
              stars
              puts
              puts "Press Enter to return to menu"
              gets
          end


@keno_payout.each.with_index do |element, i|
    element.each do |key, value|
        if value == @length_common
            element[:payout] = @current_payout 
            puts "current payout: #{@current_payout}"
        end
    end
end