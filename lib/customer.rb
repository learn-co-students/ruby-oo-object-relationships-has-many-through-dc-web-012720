require 'pry'

class Customer
    attr_reader :name, :age
    @@all = []
  def initialize(name, age)
    @name = name
    @age = age 
    @@all << self
  end 

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip) 

  end

  def meals
    Meal.all.select{ |meals| meals.customer == self}

  end

  def waiters
    self.meals.map{ | waiter | waiter.waiter}
    #Meal.all.select{ |meals| meals.customer == self }.map { | waiter | waiter.waiter}
  end

  def self.all
    @@all
  end 
end