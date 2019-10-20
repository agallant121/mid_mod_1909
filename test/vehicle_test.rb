require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'
require './lib/vehicle'

class VehicleTest < Minitest::Test

  def setup
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
  end

  def test_it_exists
    assert_instance_of Vehicle, @vehicle
  end

  def test_initialize
    assert_equal "2001", @vehicle.year
    assert_equal "Honda", @vehicle.make
    assert_equal "Civic", @vehicle.model
  end

  def test_it_can_be_speeding
    assert_equal false, @vehicle.speeding?
    @vehicle.speed
    assert_equal true, @vehicle.speeding?
  end

  def test_it_has_no_passengers
    assert_equal [], @vehicle.passengers
  end

  def test_it_can_add_passengers
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    @vehicle.add_passenger(charlie)
    @vehicle.add_passenger(taylor)
    @vehicle.add_passenger(jude)
    assert_equal [charlie, taylor, jude], @vehicle.passengers
  end

  def test_it_has_two_adults
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
      @vehicle.add_passenger(charlie)
      @vehicle.add_passenger(taylor)
      @vehicle.add_passenger(jude)
    assert_equal 2, @vehicle.num_adults
  end
end
