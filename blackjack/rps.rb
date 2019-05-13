puts "chose r s or p"


computer = "rsp"[rand(3)].chr

player = $stdin.gets.chomp.downcase

case [ player, computer]

when ['r', 's'], ['s', 'p'], ['r', 's']

    puts "You win"

when ['r', 'r'], ['s', 's'], ['p', 'p']
    puts "you tied"

  when ['r', 'p'], ['s', 'r'], ['p', 's']
    puts " you lose"
end

puts "the computer chose: #{computer.upcase}"

rsp = {
  1 => "rock",
  2 => "paper",
  3 => "scissors",

}
puts rsp[1]
