require_relative 'test_helper'
require_relative '../lib/statewide_test_repository'

class StatewideTestRepositoryTest < Minitest::Test

  def test_statewide_testing_repository_basics
    str = StatewideTestRepository.new
    str.load_data({
      :statewide_testing => {
        :third_grade => "./data/3rd grade students scoring proficient or above on the CSAP_TCAP.csv",
        :eighth_grade => "./data/8th grade students scoring proficient or above on the CSAP_TCAP.csv",
        :math => "./data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Math.csv",
        :reading => "./data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Reading.csv",
        :writing => "./data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Writing.csv"
      }
      })



      assert str.find_by_name("ACADEMY 20")
      assert str.find_by_name("GUNNISON WATERSHED RE1J")
    end

    # def test_it_can_return_test_proficiency_by_grade
    #
    #
    #   assert_equal statewide_test.proficient_by_grade(3)
    # end
end
