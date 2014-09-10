require './test/test_helper'

class BenzinatorCarTest < Minitest::Test
  def test_exists
    assert Benzinator::Car
  end

  def test_it_gives_back_a_single_car
    VCR.use_cassette('one_car') do
      car = Benzinator::Car.find(68)
      assert_equal Benzinator::Car, car.class

      # Check that the fields are accessible by our model
      assert_equal 68, car.id
      assert_equal "Honda", car.make
      assert_equal "Civic", car.model
      assert_equal "1996", car.year
      assert_equal "Blue", car.color
      assert_equal "XXXXXXXXXXXXXX", car.vin
      assert_equal 34, car.dealer_id
    end
  end

  def test_it_gives_back_all_the_cars
    VCR.use_cassette('all_cars') do
      result = Benzinator::Car.all

      # Make sure we got all the cars
      assert_equal 64, result.length

      # Make sure that the JSON was parsed
      assert result.kind_of?(Array)
      assert result.first.kind_of?(Benzinator::Car)
    end
  end
end

