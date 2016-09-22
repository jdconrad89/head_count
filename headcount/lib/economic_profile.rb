require_relative "economic_profile_repository"
require_relative "equations"



class EconomicProfile
include Equations
attr_reader :median_income, :childhood_poverty, :free_or_reduced_priced_lunch, :title_i

  def initialize(file_hash)
    @name = file_hash[:name]
    @median_income = file_hash[:median_household_income]
    @childhood_poverty = file_hash[:children_in_poverty]
    @free_or_reduced_priced_lunch = file_hash[:free_or_reduced_price_lunch]
    @title_i = file_hash[:title_i]
  end


  def median_household_income_in_year(year)
    incomes = median_income.map do |year_range, income|
      income if year.between?(year_range[0], year_range[1])
    end.compact

    average(incomes)
  end

  def median_household_income_average
    average(median_income.values)

  end

  def children_in_poverty_in_year(year)
    clean(childhood_poverty.values[0])
  end

  def free_or_reduced_price_lunch_percentage_in_year(year)
    free_or_reduced_priced_lunch.dig(year, :percentage)
  end

  def free_or_reduced_price_lunch_number_in_year(year)
    free_or_reduced_priced_lunch.dig(year, :total)
  end

  def title_i_in_year(year)
    clean(title_i.values[0])
  end

end
