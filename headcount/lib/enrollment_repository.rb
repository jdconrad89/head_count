require 'csv'
require 'pry'
require_relative 'enrollment'
class EnrollmentRepository

  def initialize
    @enrollments = {}
  end
  def load_data(file_hash)
    filename = file_hash[:enrollment][:kindergarten]
    contents = CSV.open filename, headers: true, header_converters: :symbol
    contents.each do |row|
      if find_by_name(row[:location]).nil?
        @enrollments[row[:location]] = Enrollment.new({name: row[:location] })
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
