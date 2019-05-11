require 'colorize'
require 'pry'
# require_relative

class Hangman
  def initialize
    main_menu
  end

  def stars
    puts "******".colorize(:yellow) * 2
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

  def start_game
    clear
    puts "Your word is being generated."
    sleep(2)
    puts "..."
    pick_word
    puts @game_word
    word_arr = @game_word.chars.to_a
    user_guesses_left = @game_word.length
    puts "Your word has been chosen. "
    puts "Guess one letter you think is in your word."
    puts "You have #{user_guesses_left} guesses left."
    puts "Choose your letter wisely!"
    user_guess = gets.strip
    if user_guess.length == 1
      
    else
      puts "Please choose one letter to guess."
    end
    # binding.pry
  end



  def exit_to_casino
    puts "code an exit here"
  end


  def main_menu 
    still_running = true
    while still_running
      # clear
      stars
      puts "  HANGMAN  "
      stars 
      user_choice = get_menu_choice 
      case user_choice
        when "1"
          start_game
        when "2"
          exit_to_casino
          still_running = false
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

  def add_word
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
    @game_word = @words.sample
  end

end

Hangman.new
