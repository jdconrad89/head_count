require_relative 'statewide_test'
require 'csv'
class StatewideTestRepository

  attr_accessor :districts
  attr_reader :test_results
    def initialize
      @test_results = {}
    end
  def load_data(file_hash)
    file_hash[:statewide_testing].each do |symbol , filename|
    contents = CSV.open filename, headers: true, header_converters: :symbol
    contents.each do |row|
  
      if find_by_name(row[:location]).nil?
        @test_results[row[:location].upcase] = StatewideTest.new({name: row[:location]})
      end
      
      find_by_name(row[:location].upcase)
    end
    
  end
    # @test_results.load_data(file_hash)
  end

    def find_by_name(input)
      
      @test_results[input]
    end

end
