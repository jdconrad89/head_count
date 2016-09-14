require_relative 'test_helper'
require_relative '../lib/district'

class DistrictTest < Minitest::Test
  def test_it_can_receive_a_hash_and_return_a_name
    d = District.new({name: "ACADEMY 20"})
    assert_equal "ACADEMY 20", d.name
  end
end
