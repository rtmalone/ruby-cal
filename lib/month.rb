require 'zellers'

class Month
  attr_reader :month, :year, :first_wkday_of_month, :days_in_month

  def initialize(month, year)
    @month = month
    @year = year
    @days_in_month = num_of_days_in_month
    @first_wkday_of_month = Zellers.calculate(month, year)
  end

  def month_name
    months_name = %w(January February March April May June July August
                     September October November December)
    months_name[@month-1]
  end

  # formats body of the calendar
  def format_body
    #convert to ISO date
    d = ((@first_wkday_of_month+5) % 7) + 1
    #reset for Sunday
    if d == 7
      d = 0
    end
    #returns very long array
    padding = Array.new(d, nil)
    result = (padding + array_of_days).each_slice(7).to_a
    until result.length == 6
      result << [nil]
    end
    result
  end

  def month_to_s
    #print both header and the result from format_body
    puts "#{month_name} #{year}".center(20).rstrip
    puts "Su Mo Tu We Th Fr Sa"
    format_body.each do |line|
      converted_line = line.map do |day|
        day.to_s.rjust(2)
      end
      puts converted_line.join(" ").rstrip
    end
  end

  def build_for_to_year
    format_body.each do |line|
      converted_line = line.map do |day|
        day.to_s.rjust(2)
      end
      converted_line.join(" ")
    end
  end

  #build a month for year cal output
  def to_year
    month_obj = []
    month_obj << "#{month_name}".center(20)
    month_obj << "Su Mo Tu We Th Fr Sa"
    month_obj.concat(build_for_to_year)
  end

  private

  def array_of_days
    (1..num_of_days_in_month).to_a
  end

  def num_of_days_in_month
    months_with_30 = [4, 6, 9, 11]
    months_with_31 = [1, 3, 5, 7, 8, 10, 12]

    if months_with_30.include?(month)
      30
    elsif months_with_31.include?(month)
      31
    elsif Zellers.leap_year?(year)
      29
    else
      28
    end
  end

end
