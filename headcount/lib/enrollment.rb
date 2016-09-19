require_relative "enrollment_repository"

class Enrollment
attr_reader :name, :year
attr_accessor :kindergarten_participation
  def initialize(data_hash)
    @name = data_hash[:name]
    @kindergarten_participation = data_hash[:kindergarten_participation]
  end

  def kindergarten_participation_by_year
    kindergarten_participation
  end

  def kindergarten_participation_in_year(year)
    kindergarten_participation[year]
  end

end
