require_relative "statewide_test_repository"
require_relative "truncate"


class StatewideTest
include Truncate
  attr_reader :name
  attr_accessor :test_proficient_by_grade
  def initialize(file_hash)
    @name = file_hash[:name]
    @test_proficient_by_grade = file_hash[:test_proficient_by_grade]
    @statewide_testing = {}
  end

  def proficient_by_grade(grade)
    StatewideTestRepository.new.load_data({
      :statewide_testing => {
        :third_grade => "./data/3rd grade students scoring proficient or above on the CSAP_TCAP.csv",
        :eighth_grade => "./data/8th grade students scoring proficient or above on the CSAP_TCAP.csv",
        :math => "./data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Math.csv",
        :reading => "./data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Reading.csv",
        :writing => "./data/Average proficiency on the CSAP_TCAP by race_ethnicity_ Writing.csv"
      }
      })
      if grade == 3
        #hash of {years => {scores => data} } for Colorado grade 3

        find_by_name("Colorado")

      elsif grade == 8

    
      end
    end

  def third_grade
    @statewide_testing
  end
  def find_by_name(input)
    clean = input.clean
    @statewide_testing[clean]
  end


end
