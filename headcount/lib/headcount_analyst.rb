require 'enrollment'
require ''



class HeadcountAnalyst


  def kindergaten_participation_rate_variation(input_1, input_2)

    year_average_1 = input_1.values.inject do |sum,num|
      (sum + num).to_f / input_1.size
    end

    district_average_1 = (year_average * 1000).floor / 1000.0

    year_average_2 = input_2.values.inject do |num, sum|
      (sum + num).to_f/ input_1.size

      district_2 = (year_average_2 * 1000).floor / 1000.0

      variation = (district_1 / disctrict_2).floor / 1000.0
  end

  # def kindergaten_participation_rate_variation_trend (input_1, input_2)










end
