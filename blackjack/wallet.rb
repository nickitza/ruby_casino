class Wallet
    def initialize
        @wallet = 500
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
