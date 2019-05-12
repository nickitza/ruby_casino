class Wallet
    attr_accessor :wallet
    def initialize
        @wallet = 0
    end
    def view_balance
        puts
        puts "Your current balance is #{@wallet}"
    end
    def decrease_balance(amount)
        @wallet -= amount  
    end
    def increase_balance(amount)
        @wallet += amount
    end
end
