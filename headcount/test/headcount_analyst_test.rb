require_relative 'test_helper'
require_relative '../lib/headcount_analyst'


class HeadcountAnalystTest < Minitest::Test

  def test_headcount_analyst_class_exists
    dr = DistrictRepository.new
    dr.load_data({
      :enrollment => {
        :kindergarten => "./data/Kindergartners in full-day program.csv"
      }
    })
    ha = HeadcountAnalyst.new(dr)

    assert ha
  end

  def test_it_can_compare_district_to_state_kindergarten_participation
    dr = DistrictRepository.new
    dr.load_data({
      :enrollment => {
        :kindergarten => "./data/Kindergartners in full-day program.csv"
      }
    })
    ha = HeadcountAnalyst.new(dr)

    assert_equal 0.766, ha.kindergarten_participation_rate_variation('ACADEMY 20', :against => 'COLORADO')
  end

end
