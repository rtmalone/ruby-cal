require_relative 'helper'
require 'zellers'
require 'month'

class CalTest < Test::Unit::TestCase

  def test_01_Feb_2012
    expected = `cal 2 2012`
    actual = `./cal 2 2012`
    assert_equal expected, actual
  end

  def test_02_02_1800
    expected = `cal 2 1800`
    actual = `./cal 2 1800`
    assert_equal expected, actual
  end

  def test_03_02_1803
    expected = `cal 2 1803`
    actual = `./cal 2 1803`
    assert_equal expected, actual
  end

  def test_04_03_2014
    expected = `cal 3 2014`
    actual = `./cal 3 2014`
    assert_equal expected, actual
  end

  def test_05_07_1800
    expected = `cal 7 1800`
    actual = `./cal 7 1800`
    assert_equal expected, actual
  end

  def test_06_12_2012
    expected = `cal 12 2012`
    actual = `./cal 12 2012`
    assert_equal expected, actual
  end

  def test_07_02_2015
    expected = `cal 2 2015`
    actual = `./cal 2 2015`
    assert_equal expected, actual
  end

  def test_08_03_2015
    expected = `cal 3 2015`
    actual = `./cal 3 2015`
    assert_equal expected, actual
  end
end
