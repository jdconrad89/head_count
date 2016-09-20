require_relative 'test_helper'
require_relative '../lib/enrollment.rb'

class EnrollmentTest < Minitest::Test


  def test_enrollment_holds_enrollment_data_for_single_district

    e = Enrollment.new({:name => "ACADEMY 20", :kindergarten_participation => {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}})

    assert_equal "ACADEMY 20", e.name
  end

  def test_enrollment_can_return_kindergarten_participation_by_year

    e = Enrollment.new({:name => "ACADEMY 20", :kindergarten_participation => {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}})

    assert_equal e.kindergarten_participation_by_year, {2010 => 0.391, 2011 => 0.353, 2012 => 0.267}
  end

  def test_enrollment_can_return_kindergarten_participation_in_specific_year
    skip
    e = Enrollment.new({:name => "ACADEMY 20", :kindergarten_participation => {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}})

    assert_equal 0.391, e.kindergarten_participation_in_year(2010)
    assert_equal nil, e.kindergarten_participation_in_year(2004)
  end

  def test_it_can_return_kindergarten_participation_for_a_district_in_a_specific_year
  er = EnrollmentRepository.new
  er.load_data({
                 :enrollment => {
                   :kindergarten => "./data/Kindergartners in full-day program.csv"
                 }
               })

  name = "GUNNISON WATERSHED RE1J"
  enrollment = er.find_by_name(name)
  assert_equal name, enrollment.name
  assert enrollment.is_a?(Enrollment)
  assert_in_delta 0.144, enrollment.kindergarten_participation_in_year(2004), 0.005

  end

end
