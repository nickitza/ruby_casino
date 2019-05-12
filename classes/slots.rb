require_relative 'ruby_casino.rb'
require 'pry'
require 'colorize'

def slots(slot1, slot2, slot3)
  if slot1==slot2 && slot2==slot3
    3
  elsif slot1==slot2 || slot2==slot3 || slot1==slot3
    2
  else
    0
  end
end

def slot_machine
  print `clear`
  slot_pic = ["Cherry", "$$$", "Clover", "Bell", "Horse Shoe", "Bar"]
  puts "___________$ S L O T S $______________"
  sleep(1)
  print `clear`
  puts "#{@player}get ready to play..."
  sleep(1)
  print `clear`
  puts "How much total money do you wanna play with today? "
  wallet = gets.strip.to_i
    print `clear`
    puts "CASH: $#{wallet}"
    puts "What's your bet ? "
    bet = gets.strip.to_i

    wallet -= bet
    

    slot_pic1 = slot_pic.shuffle.first
    slot_pic2 = slot_pic.shuffle.first
    slot_pic3 = slot_pic.shuffle.first
    print `clear`
    puts "#{slot_pic1} - #{slot_pic2} - #{slot_pic3}"

    winnings = bet * slots(slot_pic1, slot_pic2, slot_pic3)
    puts "YOU WON $#{winnings}"

    wallet += winnings

    puts "Wanna keep playing? (YES/NO)"
      quit_app = gets.strip.downcase
    if quit_app == "no"
      print `clear`
      puts "As You Wish, Until next time!"
      sleep (1)
      print `clear`
      #main_menu
    else
      puts "You now have $#{wallet}"
      slot_machine
    end
    #main_menu
end

slot_machine