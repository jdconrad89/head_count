require_relative 'test_helper'
require_relative '../lib/headcount_analyst'


class HeadcountAnalystTest < Minitest::Test

  def test_headcount_analyst_class_exists
    ha = HeadcountAnalyst.new

    assert ha
  end

  # def test_it_takes_in_a_year
  #   ha = HeadcountAnalyst.new()


end
