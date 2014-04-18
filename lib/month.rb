# require_relative 'zellers'

class Month
  attr_reader :month, :year, :first_wkday_of_month

  # weekdays = "Su Mo Tu We Th Fr Sa"

  def initialize(month, year)
    @month = month
    @year = year
    @days_in_month = days_in_month(month, year)
    @first_wkday_of_month = Zellers.calculate(month, year)
    puts @first_wkday_of_month
  end


  def month_name
    months_name = %w(January February March April May June July August September October November December)
    months_name[@month-1]
  end

  def days_in_month(month, year)
    months_with_30 = [4, 6, 9, 11]
    months_with_31 = [1, 3, 5, 7, 8, 10, 12]

    if months_with_30.include? month
      30
    elsif months_with_31.include? month
      31
    elsif Zellers.leap_year?(year)
      29
    else
      28
    end
  end

  # formats body of the calendar
  def format_body
    num_dates = (1..@days_in_month).to_a
    num_dates.map! do |date|
      if date < 10
        "  "+date.to_s
      else
        date.to_s
      end
    end
  end
end
