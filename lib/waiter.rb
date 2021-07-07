require 'pry'

class Waiter
    attr_reader :name, :years
    @@all = []
    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end 

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip) 
    end 

    def meals
        Meal.all.select{ |meals| meals.waiter == self}
    end

    def best_tipper
        biggest_tip = 0                                     #store biggest tip amount and keep comparing it to the next tip
        biggest_tipper = Customer.new("Joe", 10)            #whoever tips the most, you wanna store their information, make up a person 
        self.meals.each { |person|                          # calls the def meals method (line 16) returns a huge array of the customer + waiter objects
                                                            # looks at every customer that ordered a meal, all these people were served by Terrance, thats the reason for using self
                                                            # reason for using .each is to just return a person not an array, whenever it runs person it should give a new customer with their info (tip, total, etc)

        if person.tip > biggest_tip 
            biggest_tip = person.tip
            biggest_tipper = person.customer                #returns just the age and name of the customer or whole customer object
        end 
        }
        biggest_tipper
    
            
    end

    def self.all
        @@all
    end 
end