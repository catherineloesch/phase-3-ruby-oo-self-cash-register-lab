class CashRegister
    attr_accessor :total, :discount, :items, :prev_total, :prev_items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @prev_items = self.items
        quantity.times { self.items << title }

        @prev_total = self.total
        self.total += (price * quantity)
    end

    def void_last_transaction
        self.total = @prev_total
        self.items = @prev_items
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            self.total -= discount.to_f/100 * self.total
            "After the discount, the total comes to $#{self.total % 1 == 0 ? self.total = self.total.to_i : self.total}."
        end
    end

end