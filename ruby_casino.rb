class Player
    attr_accessor :name, :wallet
    def initialize(name, wallet)
        @player = name
        @running_total = wallet
    end
end

# class Games 
#     attr_accessor :name
#     def initialize(name)
#         @games << 
#         @games = ["Blackjack", "Hangman", "Slot Machine", "Roulette"]
#     end
# end 

@games = ["Blackjack", "Hangman", "Slot Machine", "Roulette", "Keno"]

puts "Welcome to Our Casino." 
def main_menu
    puts "What game would you like to play?"
    @games.each_with_index do |game, i|
        puts "#{i + 1}. #{dish[:name]}"
    end
    input = gets.strip.to_i
    # raise unless input > 0 && input <= @games.lenth
    #     end
    class input 
        when "1"
            #blackjack
        when "2"
            #hangman
        when "3"
            #slot_machine
        when "4"
            #roulette  
        when "5"
            #keno
        else
            puts "invalid input. try again"
            main_menu
    end
end

