class Passenger
  attr_reader :name, :age

  def initialize(pass_params)
    @name = pass_params["name"]
    @age = pass_params["age"]
    @driver = false
  end

  def adult?
    @age >= 18
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
    # require "pry"; binding.pry
  end

end
