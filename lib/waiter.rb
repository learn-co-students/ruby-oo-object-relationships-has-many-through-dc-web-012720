class Waiter
    attr_reader :name, :years_exp

    @@all = []

    def initialize(name, years_exp)
        @name = name
        @years_exp = years_exp

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.find_all do |meals| meals.waiter == self
        end
    end

    def best_tipper
        big_tip = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        big_tip.customer
    end
end