#require_relative 'helper'
class Zellers

  def self.calculate(input_month, input_year)
    m = input_month.to_i
    y = input_year.to_i
    k = input_year%100
    j = (input_year/100).floor

    # In the implementation of Zeller's Formula, Jan & Feb are treated as months
    # 13 and 14 of previous year. Weekdays are treated as 0-6 with Saturday
    # beginning at 0

    if m < 3
      m += 12
      y -= 1
      weekday = (1 + (((m+1)*26)/10) + y + (y/4) + (6*(y/100)) + (y/400)) % 7
    else
      weekday = (1 + ((13*(m+1))/5) + k + (k/4) + (j/4) + (5*j) ) % 7
    end
    #weekday -= 1
  end


end
