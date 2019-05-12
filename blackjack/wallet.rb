class Wallet
  def initialize
    money
  end

  def money
    start_amount = 500
    wager = gets.to_i
    new_total = start_amount - wager
    puts new_total
  end
end
Wallet.new
