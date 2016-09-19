require_relative 'enrollment_repository'
require_relative 'district_repository'


class HeadcountAnalyst
attr_reader :district
  def initialize(input)
    @district = input
  end

  def kindergarten_participation_rate_variation(input_1, input_2)
    district1 = district.find_by_name(input_1)
    district2 = district.find_by_name(input_2.values.to_s.gsub(/\d|\W/, "").downcase.capitalize)

    district1_values = district1.enrollment.kindergarten_participation.values
    district2_values = district2.enrollment.kindergarten_participation.values
    district1_average = district1_values.inject {|sum, num| sum + num} / district1_values.length
    district2_average = district2_values.inject {|sum, num| sum + num} / district2_values.length

    ((district1_average/ district2_average) * 1000).floor / 1000.0
  end
end
