require_relative 'helper'
require 'month'

class TestMonth < Test::Unit::TestCase

  def test_01_month_can_see_method
    assert Month.respond_to? :new
  end

  def test_02_instance_of_class
    cal = Month.new(11,2005)
    assert_instance_of(Month, cal)
  end

  def test_03_correct_name_returned
    cal = Month.new(11, 2006)
    assert_equal("November", cal.month_name)
  end

  def test_04a_correct_num_of_days_in_month
    cal = Month.new(11, 2006)
    assert_equal(30, cal.days_in_month)
  end

  def test_04b_correct_num_of_days_leap_year
    cal = Month.new(2, 2012)
    assert_equal(29, cal.days_in_month)
  end

  def test_04c_correct_num_of_days_feb
    cal = Month.new(2, 2013)
    assert_equal(28, cal.days_in_month)
  end
end
