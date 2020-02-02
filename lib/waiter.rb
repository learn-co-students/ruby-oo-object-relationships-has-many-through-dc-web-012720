class Waiter
    attr_accessor :name, :years_of_exp
    @@all = []
    def initialize(name, years_of_exp)
        @name = name
        @years_of_exp = years_of_exp
        @@all << self
    end 

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end 

    def meals 
        Meal.all.select { |meal| meal.waiter == self}
    end 
    #iterate through every meal instance and returns the ones where meal's waiter instance
    #matches the current waiter's instance 



    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
      end

    def self.all
        @@all
    end 
end