require 'colorize'
require 'pry'
# require_relative '~/Documents/dpl/week1/friday/ruby_casino/ruby_casino.rb'

class Hangman
  attr_accessor :letters_left
  def initialize
    @letters_left = ('a'..'z').to_a.join(" ")
    @user_word = ""
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

  def generate_word
    clear
    puts "Your word is being generated."
    puts "..."
    # sleep(2)
    pick_word
    @word_arr = @game_word.chars.to_a
    @user_word = "_" * @word_arr.length
    @user_word = @user_word.chars.to_a
    puts "Your word has been chosen. "
    puts @game_word
    puts "Guess one letter you think is in your word."
    @guesses_left = @game_word.length
    puts "You have #{@guesses_left} guesses left."
    puts "Choose your letter wisely!"
    puts
    puts "Press enter to continue.".colorize(:red)
    gets
    clear
    get_guess
  end

  def get_guess
    while !game_over
      puts
      puts
      puts "Which of the available letters would you like to choose?"
      puts @letters_left
      @user_guess = gets.strip.downcase
      if @user_guess.length == 1
        if @word_arr.include?(@user_guess)
          right_guess
          get_guess
          else
            wrong_guess
            get_guess
        end
        else
          puts "Please choose one letter to guess."
          get_guess
      end
    end
    game_end
  end

  def right_guess
    remove_letter
    clear
    puts "Hooray!! You're right! That letter is in the word!"
    @word_arr.each_with_index do |w, i|
      if @word_arr[i].include?(@user_guess)
        @user_word[i] = @user_guess
        else
      end
    end
    print @user_word.join(" ")
  end

  def wrong_guess
    remove_letter
    clear
    @guesses_left -= 1
    puts "Oh no! That letter is not in your word!"
    puts "You have #{@guesses_left} guesses left."
    print @user_word.join(" ")    
  end

  def remove_letter
    @letters_left = @letters_left.delete(@user_guess)
  end

  def game_over
    (@guesses_left == 0) || (@user_word.eql?(@word_arr))
  end

  
  def game_end
    if @guesses_left == 0
      puts
      puts "GAME OVER".colorize(:red)
      puts "You ran out of guesses! Your man hangs!"
      hang_ascii
      puts "Press enter to return to the main menu.".colorize(:red)
      gets
      reset
      main_menu
      else
      puts "\nCONGRATULATIONS!".colorize(:green)
      puts "You guessed the word! Your man goes free!"
      puts "Press enter to return to the main menu.".colorize(:red)
      gets
      reset
      main_menu
      end
  end

  def reset
    @letters_left = ('a'..'z').to_a.join(" ")
    @user_word = ""
  end

  def exit_to_casino
    puts "We hope to see you again soon! Goodbye!"
    Casino.main_menu

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

end

# Hangman.new
