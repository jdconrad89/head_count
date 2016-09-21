require 'csv'
require 'pry'
require_relative 'economic_profile'


class EconomicProfileRepository

  attr_reader :economic_profile
  def initialize
    @economic_profile = {}
  end

  def load_data(file_hash)
    file_hash[:economic_profile].each do |symbol , filename|
      contents = CSV.open filename, headers: true, header_converters: :symbol
      contents.each do |row|
        if find_by_name(row[:location]).nil?
          @economic_profile[row[:location].upcase] = EconomicProfile.new({name: row[:location], median_household_income: {}})
        end
        find_by_name(row[:location].upcase)
      end
    end
  end

  def find_by_name(input)
    @economic_profile[input]
  end
end
