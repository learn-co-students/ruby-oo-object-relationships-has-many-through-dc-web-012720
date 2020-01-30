require 'pry'

class Waiter
    attr_reader :name, :yrs_experience
    
    @@all = []

    def initialize (name, yrs_experience)
        @name = name
        @years = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal_object|
            meal_object.waiter == self
        end
    end

    # def largest_tip
    #     tips = self.meals.map {|meal_object| meal_object.tip}
    #     tips.max
    # end

    # def best_tipper
    #     largest_tipper_object = self.meals.detect do |meal_object|
    #         if meal_object.tip == self.largest_tip
    #             return meal_object.customer
    #         end
    #     end
    # end

    def best_tipper
        best_tipped_meal = self.meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end
    
end