
class CashRegister
    attr_accessor :total, :discount, :items, :transaction, :quantity

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @quantity = quantity
        @transaction = price * quantity
        self.total += self.transaction
        quantity.times {self.items << title}
    end

    def apply_discount
        if self.discount != 0
            self.total -= (self.total * (self.discount.to_f/100))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.transaction
        self.quantity.times {self.items.pop}
    end
end