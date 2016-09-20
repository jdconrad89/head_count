require_relative "enrollment_repository"
require_relative "truncate"
class Enrollment
include Truncate
attr_reader :name, :year
attr_accessor :kindergarten_participation

  def initialize(data_hash)
    @name = data_hash[:name]
    @kindergarten_participation = data_hash[:kindergarten_participation]
    @year = data_hash[:year]
    @enrollments_by_name = []
  end

  def kindergarten_participation_by_year
    clean(kindergarten_participation)
  end

  def kindergarten_participation_in_year(year)
    clean(kindergarten_participation[year])
  end

  def find_by_name(input)
    @enrollments.select do |v|
      @enrollments_by_name << v[:name] == "input"
    end
  end

end
