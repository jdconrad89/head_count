require 'csv'
puts "why this shit not work"

contents = CSV.open "small_data_set.csv", headers: true, header_converters: :symbol

contents.each do |row|
  location = row[:location]
  puts "#{location}"
end
