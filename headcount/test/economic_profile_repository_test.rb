require_relative 'test_helper'
require_relative '../lib/economic_profile_repository'

class EconomicProfileRepositoryTest < Minitest::Test

  def test_economic_profile_repository_class_exists
    epr = EconomicProfileRepository.new


    assert_equal EconomicProfileRepository, epr.class
  end

  def test_loading_econ_profile_data
    epr = EconomicProfileRepository.new
    epr.load_data({
                    :economic_profile => {
                      :median_household_income => "./data/Median household income.csv",
                      :children_in_poverty => "./data/School-aged children in poverty.csv",
                      :free_or_reduced_price_lunch => "./data/Students qualifying for free or reduced price lunch.csv",
                      :title_i => "./data/Title I students.csv"
                    }
                  })
    ["ACADEMY 20","WIDEFIELD 3","ROARING FORK RE-1","MOFFAT 2","ST VRAIN VALLEY RE 1J"].each do |dname|
      assert epr.find_by_name(dname).is_a?(EconomicProfile)
    end
  end


end
