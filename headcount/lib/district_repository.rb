require 'csv'
require_relative 'district'
require_relative 'enrollment_repository'

class DistrictRepository
  attr_accessor :contents, :student_repository, :districts
  attr_reader :enrollments

  def initialize
    @districts = {}
    @enrollments = EnrollmentRepository.new
  end

  def load_data(file_hash)
    filename = file_hash[:enrollment][:kindergarten]
    contents = CSV.open filename, headers: true, header_converters: :symbol
    contents.each do |row|
      if find_by_name(row[:location]).nil?
        @districts[row[:location]] = District.new({name: row[:location] })
      end
    end
    @enrollments.load_data(file_hash)
    assign_matches
  end

  def assign_matches
    districts.each do |name, district|
      district.enrollment = enrollments.find_by_name(name)
    end

  end

  def find_by_name(input)
    @districts[input]
  end
  #
  def find_all_matching(input)
    @districts.select do |name, district|
      district if name.include?(input)
    end.keys.to_s.gsub(/[^0-9a-z ]/i, '').strip
  end
end
