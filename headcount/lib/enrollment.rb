require_relative "enrollment_repository"
require_relative "truncate"
class Enrollment
include Truncate
attr_reader :name, :year
attr_accessor :kindergarten_participation, :high_school_graduation

  def initialize(data_hash)
    @name = data_hash[:name]
    @kindergarten_participation = data_hash[:kindergarten_participation]
    @year = data_hash[:year]
    @high_school_graduation = data_hash[:high_school_graduation]
    @enrollments_by_name = []
  end

  def kindergarten
    kindergarten_participation
  end

  def kindergarten_participation_by_year
    clean(kindergarten_participation)
    kindergarten_participation.keys.zip(@zippy).to_h
  end

  def kindergarten_participation_in_year(year)
    clean(kindergarten_participation[year])
  end

  def find_by_name(input)
    @enrollments.select do |v|
      @enrollments_by_name << v[:name] == "input"
    end
  end

  def graduation_rate_by_year
    clean(high_school_graduation)
    high_school_graduation.keys.zip(@zippy).to_h
  end

  def graduation_rate_in_year(year)
    clean(high_school_graduation[year])
  end

  def kindergarten_participation_against_high_school_graduation
  end
end
