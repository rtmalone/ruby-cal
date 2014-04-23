require 'Month'

class Year
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def year_to_s
    puts title
    puts month_qrtrs(1,2,3)
    puts month_qrtrs(4,5,6)
    puts month_qrtrs(7,8,9)
    puts month_qrtrs(10,11,12)
  end

  private

  def title
    @year.to_s.center(64).rstrip
  end

  def new_month(month, year)
    month = Month.new(month, year)
    month.to_year
  end

  def month_qrtrs(one, two, three)
    row = new_month(one, @year).zip(new_month(two, @year), new_month(three, @year))
    row.map {|line| line.join(" ")}
  end

end
