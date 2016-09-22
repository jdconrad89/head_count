require_relative 'test_helper'
require_relative '../lib/district_repository'
require_relative '../lib/student'

class DistrictRepositoryTest < Minitest::Test

  def test_directory_repository_class_exists

    dr = DistrictRepository.new
    assert dr
  end

  def test_dr_can_load_data
    dr = DistrictRepository.new
    dr.load_data({
      :enrollment => {
        :kindergarten => "./data/Kindergartners in full-day program.csv"
      }
    })
    assert_equal 181, dr.districts.values.length
  end

  def test_it_can_find_a_district_by_name
    dr = DistrictRepository.new
    dr.load_data({
      :enrollment => {
        :kindergarten => "./data/Kindergartners in full-day program.csv"
      }
    })
    district = dr.find_by_name("ACADEMY 20")
    assert_equal "ACADEMY 20", district.name
  end

  def test_it_can_find_all_matching
    dr = DistrictRepository.new
    dr.load_data({
      :enrollment => {
        :kindergarten => "./data/Kindergartners in full-day program.csv"
      }
    })

    assert_equal "ACADEMY 20", dr.find_all_matching("ACA")
  end
  

end
