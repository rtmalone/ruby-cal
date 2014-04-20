require 'zellers'

class Month
  attr_reader :month, :year, :first_wkday_of_month, :days_in_month

  # weekdays = "Su Mo Tu We Th Fr Sa"

  def initialize(month, year)
    @month = month
    @year = year
    @days_in_month = num_of_days_in_month
    @first_wkday_of_month = Zellers.calculate(month, year)
  end


  def month_name
    months_name = %w(January February March April May June July August September October November December)
    months_name[@month-1]
  end

  # formats body of the calendar
  def format_body
    #return string for wkdays "Su"
    #convert to ISO date
    d = ((@first_wkday_of_month+5) % 7) + 1
    #reset for Sunday
    if d == 7
      d == 0
    end
    #returns very long array
    padding = Array.new(d, nil)
    (padding + array_of_days).each_slice(7).to_a

  end

  def print
    #print both header and the result from format_body
    puts "#{month_name} #{year}".center(20)
    puts "Su Mo Tu We Tu Fr Sa"
    format_body.each do |line|
      con_line = line.map do |day|
        day.to_s.rjust(2)
      end
      puts con_line.join(" ")
    end
  end

  private

  def array_of_days
    (1..num_of_days_in_month).to_a
  end

  def num_of_days_in_month
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

end
