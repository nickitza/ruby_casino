require 'colorize'
require 'pry'

class Hangman
  def initialize
    main_menu
  end

  def stars
    puts "******".colorize(:yellow) * 2
  end

  def clear
    print `clear`
  end

  def get_menu_choice
    puts "1) New Game"
    puts "2) Exit"
    gets.strip
  end

  def new_game
    puts "new game started."
  end

  def exit_to_casino
    puts "code an exit here"
  end


  def main_menu 
    still_running = true
    while still_running
      clear
      stars
      puts "  HANGMAN  ".colorize(:color => :black, :background => :white)
      stars 
      user_choice = get_menu_choice 
      case user_choice
        when "1"
          clear
          new_game
        when "2"
          exit_to_casino
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
    end
  end



  def pick_word
    @words = [
      "hippopotamus",
      "puzzled",
      "fungus",
      "flourish",
      "royal",
      "branch",
      "embezzle",
      "supernatural",
      "cottage",
      "ambitious",
      "pervasive",
      "ridiculous",
      "superimpose",
      "appliance",
      "flawless",
      "redundant",
      "raucous",
      "apparatus",
      "castle",
      "sweltering",
      "heartbreaking",
      "dynamic",
      "saxophone",
      "juggle",
      "regret",
      "rustic",
      "petite",
      "exotic",
      "bushel",
      "mellow",
      "fairies",
      "computer",
      "obtain",
      "vampire"
    ]
    game_word = @words.sample
  end

end

Hangman.new
