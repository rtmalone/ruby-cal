require 'test/unit'
require_relative 'helper'
require 'zellers'

class TestZellers < MiniTest::Unit::TestCase

  # Easy wins...

  def test_01_zellers_has_can_see_method
    assert Zellers.respond_to? :calculate
  end

  def test_02_instance_of_class
    zellers = Zellers.new
    assert_instance_of(Zellers, zellers)
  end

  def test_03_nov_1981
    weekday = Zellers.calculate(11, 1981)
    assert_equal(1, weekday)
  end

  def test_04_feb_1982
    weekday = Zellers.calculate(2, 1982)
    assert_equal(2, weekday)
  end

  def test_04_feb_2013
    weekday = Zellers.calculate(2, 2013)
    assert_equal(6, weekday)
  end

  def test_05_may_1984
    weekday = Zellers.calculate(5, 1984)
    assert_equal(3, weekday)
  end
=begin
  def test_01_01_2014
    zellers = Zellers.new(2, 2012)
    assert_equal 4, zellers.first_day_of_month
  end
=end

end
