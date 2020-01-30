class Waiter

    @@all = []
    attr_reader :name, :years_experience
    def initialize(name, years_experience)
        @name = name
        @experience = years_experience
        @@all << self
    end

    def self.all()
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end
end