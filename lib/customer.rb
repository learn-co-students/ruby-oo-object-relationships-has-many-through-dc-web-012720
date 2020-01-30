require_relative './meal.rb'
require_relative './waiter.rb'
require 'pry'

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
    Meal.all.find_all do |meals| meals.customer == self
    end
  end

  def waiters
    meals.map do |meals|
        meals.waiter
    end
  end

end