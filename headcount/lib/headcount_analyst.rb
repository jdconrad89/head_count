require_relative 'enrollment_repository'
require_relative 'district_repository'


class HeadcountAnalyst
include Equations
attr_reader :district
  def initialize(input)
    @district = input
  end

  def kindergarten_participation_rate_variation(input_1, input_2)
    district1 = district.find_by_name(input_1)
    district2 = district.find_by_name(input_2[:against].upcase)
    district1_values = district1.enrollment.kindergarten_participation.values

    district2_values = district2.enrollment.kindergarten_participation.values
    district1_average = district1_values.inject(:+) / district1_values.length
    district2_average = district2_values.inject(:+) / district2_values.length

    ((district1_average/ district2_average) * 1000).floor / 1000.0

  end

  def kindergarten_participation_rate_variation_trend(input_1, input_2)
    district1 = district.find_by_name(input_1)
    district2 = district.find_by_name(input_2[:against].upcase)
    district1_values = district1.enrollment.kindergarten_participation.values
    district2_values = district2.enrollment.kindergarten_participation.values
     zipper = district1_values.zip(district2_values)
     zippy = zipper.map do |zip|
       ((zip[0]/zip[1]) * 1000).floor / 1000.0
     end
     district1.enrollment.kindergarten_participation.keys.zip(zippy).to_h

  end


  def high_school_graduation_rate_variation(input_1, input_2)
    district1 = district.find_by_name(input_1)
    district2 = district.find_by_name(input_2[:against].upcase)
    district1_values = district1.enrollment.high_school_graduation.values
    district2_values = district2.enrollment.high_school_graduation.values
    district1_average = district1_values.inject(:+) / district1_values.length
    district2_average = district2_values.inject(:+) / district2_values.length

    ((district1_average/ district2_average) * 1000).floor / 1000.0
    # binding.pry
  end

  def high_school_graduation_rate_variation_trend(input_1, input_2)
    district1 = district.find_by_name(input_1)
    district2 = district.find_by_name(input_2[:against][:for][:across].upcase)
    district1_values = district1.enrollment.high_school_graduation.values
    district2_values = district2.enrollment.high_school_graduation.values
     zipper = district1_values.zip(district2_values)
     zippy = zipper.map do |zip|
       ((zip[0]/zip[1]) * 1000).floor / 1000.0
     end
     district1.enrollment.high_school_graduation.keys.zip(zippy).to_h

  end

  def kindergarten_participation_against_high_school_graduation(district)
    kinder = kindergarten_participation_rate_variation(district, against: "COLORADO")
    highschool = high_school_graduation_rate_variation(district, against: "COLORADO")
    # binding.pry
    clean(kinder / highschool)
  end

  def kindergarten_participation_correlates_with_high_school_graduation(input)
    if input[:for] == "STATEWIDE"
      kindergarten_participation_correlates_with_high_school_graduation_one("COLORADO").between?(0.7, 1)
      binding.pry
    elsif input[:across]
      districts_avg = input[:across].map do |district|
        kindergarten_participation_against_high_school_graduation(district)
      end
      districts_avg.inject(:+) / districts_avg.length
    else
      kindergarten_participation_against_high_school_graduation(input[:for]).between?(0.6, 1.5)
    end
  end

  def kindergarten_participation_rate_variation_one_input(input_1)
    district1 = district.find_by_name(input_1)
    district1_values = district1.enrollment.kindergarten_participation.values

    district1_average = district1_values.inject(:+) / district1_values.length

    (district1_average * 1000).floor / 1000.0

  end

    def high_school_graduation_rate_variation_one_input(input_1)
      district1 = district.find_by_name(input_1)
      district1_values = district1.enrollment.high_school_graduation.values

      district1_average = district1_values.inject(:+) / district1_values.length

      (district1_average * 1000).floor / 1000.0

    end

    def kindergarten_participation_correlates_with_high_school_graduation_one(input)
        kinder = kindergarten_participation_rate_variation_one_input(input)
        highschool = high_school_graduation_rate_variation_one_input(input)
        # binding.pry
        clean(kinder / highschool)
      end
end
