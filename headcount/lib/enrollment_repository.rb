require 'csv'
require 'pry'
require_relative 'enrollment'
class EnrollmentRepository

  def initialize
    @enrollments = {}
  end

  def load_data(file_hash)
    # binding.pry
    file_hash[:enrollment].each do |symbol , filename|
    # filename = file_hash[:enrollment][:kindergarten][:high_school_graduation]
    contents = CSV.open filename, headers: true, header_converters: :symbol
    contents.each do |row|
      if find_by_name(row[:location]).nil?
        @enrollments[row[:location]] = Enrollment.new({name: row[:location], kindergarten_participation: {}, high_school_graduation: {}})
      end
      find_by_name(row[:location]).send(symbol.to_s)[row[:timeframe].to_i] = row[:data].to_f

    end
  end
  end

  def enrollment
    @enrollments
  end

  def find_by_name(input)
    @enrollments[input]

  end

end
