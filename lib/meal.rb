class Meal

    attr_reader :name, :age
    @@all = []
    def initialize(waiter, customer, total, tip=0)
        @waiter = name
        @customer = age
        @total = total
        @tip = tip
        @@all << self
    end

    def self.all()
        @@all
    end

end