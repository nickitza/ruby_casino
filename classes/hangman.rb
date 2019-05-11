require 'colorize'
require 'pry'
# require_relative

class Hangman
  def initialize
    main_menu
  end

  def main_menu 
    still_running = true
    while still_running
      clear
      stars
      hang_ascii
      stars
      puts "  HANGMAN  "
      stars 
      user_choice = get_menu_choice 
      case user_choice
        when "1"
          generate_word
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

  def get_menu_choice
    puts "1) New Game"
    puts "2) Exit"
    gets.strip
  end

  def guesses_left
    @guesses_left = @game_word.length
  end

  def get_guess
    puts "Which letter would you like to choose?"
    @user_guess = gets.strip
    if user_guess.length == 1

      
    else
      puts "Please choose one letter to guess."
      get_guess
    end
  end



  def generate_word
    clear
    puts "Your word is being generated."
    sleep(2)
    puts "..."
    pick_word
    puts "__ " * @game_word.length
    puts @game_word
    word_arr = @game_word.chars.to_a
    puts "Your word has been chosen. "
    puts "Guess one letter you think is in your word."
    puts "You have #{@guesses_left} guesses left."
    puts "Choose your letter wisely!"
    @user_guess = gets.strip
    if @user_guess.length == 1
      
    else
      puts "Please choose one letter to guess."
    end
    # binding.pry
  end



  def exit_to_casino
    puts "code an exit here"
  end

  def hang_ascii  
  print " ____________    \n"
    print "|         |    \n"
    print "|         0    \n"
    print "|        /|\\  \n"
    print "|        / \\  \n"
    print "|              \n"
    print "|              \n"
    print "|              \n"
    print "_____________  \n"
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

  def stars
    puts "******".colorize(:yellow) * 2
    puts "******".colorize(:yellow) * 2
  end

  def clear
    print `clear`
  end

end

Hangman.new
