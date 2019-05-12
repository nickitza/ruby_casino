require_relative 'wallet'
require 'colorize'


class Player < Wallet
    attr_accessor :name
    def initialize
        @player = nil
        player_info
    end
    def player_info
        puts
        puts
        puts "Welcome to our casino, where dreams come true...".colorize(:blue)
        puts
        puts
        sleep(0.2)
        puts "who will be playing today?"
        get_player_name
        puts
        puts
        sleep(0.2)
        puts "And how much can you play with today?"
        puts "This casino does have a minimum starting amount of $100."
        get_wallet
        sleep(0.1)
        puts
        puts "Great! #{@player}, you'll be playing with $#{@wallet}. Is that correct? (y/n)"
        correct_player
    end
    def correct_player   
        choice = gets.strip
        if choice == 'y'
            puts
            puts 
            puts "Do you want to add a little more to your wallet before going into the casino? (y/n)"
            choice2 = gets.strip
            if choice2 == 'n'
                puts
                puts "Ok #{@player}, enjoy!"
                Casino.new
            elsif choice2 == 'y'
                puts
                puts "Great! What new total would you like to work with?"
                puts "You previously only had $#{@wallet}."
                get_wallet
            end
        elsif choice == 'n'
            puts "Do you need to change: name, wallet, or both?"
            choice3 = gets.strip
            case choice
            when "name"
                puts
                puts "What name would you like to replace it with?"
                get_player_name
            when "wallet"
                puts
                puts "What amount would you like to play with?"
                get_wallet
            when "both"
                puts
                puts "What name would you like to replace it with?"
                get_player_name
                puts
                puts "What amount would you like to play with?"
                get_wallet
                puts "Great! #{@player}, you'll be playing with $#{@wallet}. Is that correct? (y/n)"
                correct_player
            end
        end
    end
    def get_player_name
        @player = gets.strip.to_s
        puts
        puts "#{@player}, we're happy to have you here with us today."
    end
    def get_wallet
        puts
        @wallet = gets.strip.to_i
        if @wallet < 100
            puts 
            puts "Apologies but this casino has a minimum pay-to-play amount of $100."
            sleep(1)
            puts "What amount would you like to play with today?"
            get_wallet
        elsif @wallet == 0
            puts
            puts "Sooooo... you wanted to gamble with zero dollars..?"
            sleep(1)
            puts "Let's try again! What amount would you like to play with today?"
            get_wallet
        else
            puts
            puts
            puts "Awesome! You'll be playing with an account balance of #{@wallet}. #{@player}, good luck!!"
        end
    end
end
# Player.new