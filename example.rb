weekday = %w(Su Mo Tu We Th Fr Sa)
cal_header = "November 2005"

puts cal_header.center(20)
[weekday,
[nil,nil,1,2,3,4,5],
[6,7,8,9,10,11,12],
[13,14,15,16,17,18,19],
[20,21,22,23,24,25,26],
[27,28,29,30]].each do |line|
  converted_line = line.map do |day|
    day.to_s.rjust(2)
  end
  puts converted_line.join(" ")
end


