require 'pry'
class CashRegister
    attr_accessor :total, :discount, :lastTransaction, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount 
        @items = []
        #@lastTransaction = 0
    end

    def add_item(title, price, quantity = 1)
        self.total = self.total + (price * quantity)
        count = 0
        while count < quantity
            self.items << title      
            count += 1
        end

        #self.lastTransaction = 0  #why is this not resetting!
        #binding.pry
        self.lastTransaction = (price * quantity)
    end

    def apply_discount
        if self.discount > 0
            self.total = self.total * ((100 - self.discount) / 100.0)   
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.lastTransaction
        return self.total
    end

end

