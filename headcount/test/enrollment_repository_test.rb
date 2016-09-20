require_relative 'test_helper'
require_relative '../lib/enrollment_repository.rb'

class EnrollmentRepositoryTest < Minitest::Test

  def test_enrollment_repository_exists

    er = EnrollmentRepository.new


    assert_equal EnrollmentRepository, er.class
  end

  def test_dr_can_load_data

    er = EnrollmentRepository.new
    er.load_data({
      :enrollment => {
        :kindergarten => "./data/Kindergartners in full-day program.csv"
      }
      })
    # er.load_data(filename).enrollment
    assert_equal 181, er.enrollment.values.length
  end

  def test_it_can_find_a_district_by_name

    er = EnrollmentRepository.new
    er.load_data({
      :enrollment => {
        :kindergarten => "./data/Kindergartners in full-day program.csv"
      }
      })
    enrollment = er.find_by_name("ACADEMY 20")
    assert_equal "ACADEMY 20", enrollment.name
  end

end
