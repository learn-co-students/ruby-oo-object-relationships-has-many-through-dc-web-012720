require_relative "meal.rb"

class Customer
    attr_reader :name, :age

    @@all = []
  
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select do |meal_object|
            meal_object.customer == self
        end
    end

    def waiters
        self.meals.map do |meal_object|
            meal_object.waiter
        end
    end

end