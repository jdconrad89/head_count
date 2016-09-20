require_relative "statewide_test_repository"
require_relative "truncate"


class StatewideTest
include Truncate

  def initialize(file_hash)
    @name = file_hash[:name]
  end

  def proficient_by_grade(grade)
  end



end
