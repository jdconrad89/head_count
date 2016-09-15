require 'csv'
require_relative 'district'

class DistrictRepository
  attr_accessor :contents, :student_repository, :districts

  def initialize
    @districts = {}
  end

  def load_data(file_hash)
    filename = file_hash[:enrollment][:kindergarten]
    contents = CSV.open filename, headers: true, header_converters: :symbol
    contents.each do |row|
      if find_by_name(row[:location]).nil?
        @districts[row[:location]] = District.new({name: row[:location] })
      end
      # binding.pry
    end
   end

   def find_by_name(input)
     @districts[input]
   end
  #
  def find_all_matching(input)
    @districts.select do |name, district|
      district if name.include?(input)
    end.values
  end
end
