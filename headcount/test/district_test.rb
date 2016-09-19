require_relative 'test_helper'
require_relative '../lib/district'
require_relative '../lib/district_repository'

class DistrictTest < Minitest::Test
  def test_it_can_receive_a_hash_and_return_a_name
    d = District.new({name: "ACADEMY 20"})
    assert_equal "ACADEMY 20", d.name
  end

  def test_district_knows_about_its_enrollment
    dr = DistrictRepository.new
    dr.load_data({
      :enrollment => {
        :kindergarten => "./data/Kindergartners in full-day program.csv"
      }
    })
    district = dr.find_by_name("ACADEMY 20")
    assert_equal 0.436, district.enrollment.kindergarten_participation_in_year(2010)
  end
end
