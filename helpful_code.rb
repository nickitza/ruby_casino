##### Random Number Generation:
rand => 0.1234234214
rand(1) => 0 or 1
rand(10) => a random number between 0 and 9
rand(5..9) => a random number between 5 and 9 inclusive

##### Rolling Die

# CODE
class Dice
    def initialize
      roll
    end
    
    def roll
      @die1 = 1 + rand(6)
      @die2 = 1 + rand(6) 
    end
    
    def show_dice
      print "Die1: ", @die1, " Die2:", @die2
    end
    
    def show_sum
      print "Sum of dice is ", @die1 + @die2, ".\n"
    end 
   end

# EXAMPLE
d = Dice.new
d.show_dice
puts
d.show_sum

##### DECK OF CARDS 

# Card Class 
class Card
    # Getter and Setter methods for rank, suit and color
    attr_accessor :rank, :suit, :color
    # Gets called when you call the new method to create an instance
    # card = Card.new('10', 'K', 'Black')
    def initialize(rank, suit, color)
      @rank = rank
      @suit = suit
      @color = color
    end
   end
end

# Deck Class
class Deck
    # Getter and Setter methods for rank, suit and color
    attr_accessor :cards
   
    # Gets called when you call the new method to create an instance
    # deck = Deck.new
    def initialize
      @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
      @suits = %w(Spades Diamonds Clubs Hearts)
      @cards = []
      generate_deck
    end
   
    def shuffle_cards
     @cards.shuffle
    end
    
    def generate_deck
      @suits.each do |suit|
        @ranks.size.times do |i|
          # Ternary Operator
          color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
          @cards << Card.new(@ranks[i], suit, color)
        end
      end
    end
   
     def display_cards
       @cards.shuffle.each do |card|
         puts "#{card.rank} #{card.suit} (#{card.color})"
       end
     end
   end
end

# Example 
# Instantiate a new deck
d = Deck.new

############## Requiring Ruby Files Inside of Other Ruby Files: 
#It's good practice to just have 1 class per file 
# or you could end up with a huge unmaintainable mess of classes in a single file. 
# You only need 1 line of code to require another file (class) into another file (class)
require_relative 'card'