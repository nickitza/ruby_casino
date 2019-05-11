 # make aces = 11 unless hand is over 21

class Eleven
  def initialize
    ace
  end
  def ace
    a = 11
    puts a
  end
end

class One < Eleven
  def initialize
    ace
  end
  def ace
    a = 1
    puts a
  end
end

Eleven.new
One.new
