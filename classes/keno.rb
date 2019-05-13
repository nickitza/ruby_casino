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

@keno_payout = [{index: 1, payout: 1},{index: 2, payout: 4},
    {index: 3, payout: 6},{index: 4, payout: 8},{index: 6, payout: 10},
    {index: 7, payout: 50},{index: 8, payout: 500}, {index: 9, payout: 1000},
    {index: 10, payout: 5000},{index: 11, payout: 8000},
    {index: 12, payout: 10000},{index: 13, payout: 15000},{index: 14, payout: 20000},
    {index: 15, payout: 30000},{index: 16, payout: 50000},{index: 17, payout: 80000},
    {index: 18, payout: 100000},{index: 19, payout: 150000},{index: 20, payout: 200000}]

@random_twenty = []
@random_fifteen = []

class Keno
    attr_accessor :keno_wallet
    def initialize
        #keno_wallet = @wallet
        puts
        puts "Welcome to keno!".colorize(:blue)
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
        puts
        #binding.pry
        puts "How many races would you like to play with your first 15-number draw?"
        puts "* reminder each race $1, slate of 7 races $7"
        @races_number = gets.strip.to_i
    end
    def player_draw
        @random_fifteen = []
        15.times do
            # (1...15) do |a|
            #     rand(1...80)
            # #random_sample = rand(1...80)
            @random_fifteen << rand(1...80)
            #@random_fifteen << random_sample
        
        end
    end
    def dealer_draw
        @random_twenty = []
        @races_number.times do
            20.times do
                # random_sample = rand(1...80)
                # @random_twenty << random_sample
                @random_twenty << rand(1...80)
            end
        end
    end
end



Keno.new
Keno.player_draw

puts "#{@random_fifteen}"
puts 
puts "#{@random_twenty}"

  