require_relative "economic_profile_repository"
require_relative "equations"


class EconomicProfile
include Equations
attr_reader :median_income

  def initialize(file_hash)
    @name = file_hash[:name]
    @median_income = file_hash[:median_household_income]

  end

  # def year_given_in_range(year)
  #   median_range = median_income.keys.map do |key|
  #     (key[0]..key[1])
  #   end
  #
  #   median_range.each do |range|
  #     range.member?(year)
  #       median_household_income_in_year if true
  #     end
  # end


  def median_household_income_in_year(year)
    incomes = median_income.map do |year_range, income|
      income if year.between?(year_range[0], year_range[1])
    end.compact

    average(incomes)







    # binding.pry
#     median_range = median_income.keys.map do |key|
#       (key[0]..key[1])
#     end
# # binding.pry
#     median_range.each do |range|
#       range.member?(year)
#       binding.pry
#         average(median_range) if true
#       end
  end


end
