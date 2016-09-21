require_relative 'statewide_test'
require 'csv'
class StatewideTestRepository

  attr_accessor :districts
  attr_reader :test_results
    def initialize
      @test_results = {}
      # @statewide_testing = {}
    end
  def load_data(file_hash)
    file_hash[:statewide_testing].each do |symbol , filename|
    # filename = file_hash[:statewide_testing][:third_grade][:eighth_grade][:math][:reading][:writing]
    contents = CSV.open filename, headers: true, header_converters: :symbol
    contents.each do |row|
      if find_by_name(row[:location]).nil?
        @test_results[row[:location].upcase] = StatewideTest.new({name: row[:location], test_proficient_by_grade: {}})
      end
      statewide_object = find_by_name(row[:location].upcase)
      if !(statewide_object).send(symbol)[row[:timeframe].to_i]
        statewide_object.send(symbol)[row[:timeframe].to_i] = {}
      end
      statewide_object.send(symbol)[row[:timeframe].to_i][row[:score].downcase.to_sym] = row[:data].to_f
      binding.pry
    end
    binding.pry
  end
    # @test_results.load_data(file_hash)
  end

    def find_by_name(input)
      clean = input.upcase
      @test_results[clean]
    end
    # def third_grade
    #   @statewide_testing
    # end
end
