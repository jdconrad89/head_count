require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enrollment_repository.rb'

class EnrollmentRepositoryTest < Minitest::Test

  def test_enrollment_repository_exists
    enroll = EnrollmentRepository.new


    assert_equal EnrollmentRepository, enroll.class
  end
end
