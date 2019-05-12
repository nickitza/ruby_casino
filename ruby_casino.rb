require "pry"
require "colorize"
require "require_all"
#require "sounder"

require_all 'classes'

# require_relative 'classes/roulette.rb'
# require_relative 'classes/player.rb'

#casino 
    #requires player
    #cashier here
    #game menu here

class Casino < Player
    def initialize(wallet)
        @game_menu = ["Blackjack", "Hangman", "Slot Machine", "Roulette", "Keno"]
        @wallet = wallet
        main_menu
    end
    def main_menu
        puts
        puts
        puts "Please choose from one of our game options.(1-#{@game_menu.length})"
        puts
        @game_menu.each_with_index do |game, i|
            puts "#{i + 1}. #{game}"
        end
        puts "6. Leave Casino"
        puts "7. New Player"
        puts "8. Cashier"
        game_choice = gets.strip.to_i
        binding.pry
        do_choice(game_choice)
    end
    def do_choice(game_choice)
        case game_choice
        when 1
            #######################################################################
            puts "play blackjack here when added. now back to main menu..."
            main_menu
            #######################################################################
        when 2
            #######################################################################
            puts "play Hangman here when added. now back to main menu..."
            Hangman.new(@wallet)
            #######################################################################
        when 3
            #######################################################################
            puts "play Slots here when added. now back to main menu..."
            main_menu
            #######################################################################
        when 4
            #######################################################################
            puts "play Roulette here when added. now back to main menu..."
            Roulette.new(@wallet)
            #######################################################################
        when 5
            #######################################################################
            puts "play Keno here when added. now back to main menu..."
            main_menu
            #######################################################################
        when 6
            quit_casino
        when 7
            Player.new
        when 8
            cashier
        else 
            puts
            puts 
            puts "Invalid Option. Please Try Again."
            main_menu
        end
    end
    def quit_casino
        puts
        puts
        puts "Thanks for playing. Hope to see you soon!"
        puts
        exit(0)
    end
    def cashier
        puts 
        puts "Hello #{@player}, how may I help you today?"
        @cashier_menu = ["View Balance", "Add to Balance", "Withdraw balance and Leave Casino", "Return to Game Options"]
        @cashier_menu.each_with_index do |game, i|
            puts "#{i + 1}. #{game}"
            puts
            puts "Please choose option 1-#{i+1}"
        end
        choice = gets.strip.to_i
        case choice
            when 1
                puts "Your balance is $#{@wallet}."
                cashier
            when 2
                puts
                puts "#{@player}, your current balance is #{@wallet}"
                puts
                puts "How much would you like to add to your wallet?"
                puts
                add_me = gets.to_i
                increase_balance(add_me)
                main_menu
            when 3
                puts
                puts "Are you sure you'd like to withdraw your wallet and leave? (y/n)"
                choice = gets.strip.to_s
                if choice.downcase == 'y'
                    withdraw_total = @wallet.to_i
                    decrease_balance(withdraw_total)
                puts
                puts
                puts "Ok #{@player}, you've withdrawn $#{@wallet}"
                quit_casino
                else
                    cashier
                end
            when 4
                main_menu
        end
    end 
end

Casino.new(0)