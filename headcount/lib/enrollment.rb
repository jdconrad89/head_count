require_relative "enrollment_repository"

class Enrollment
attr_reader :name, :kindergarten_participation
  def initialize(data_hash)
    @name = data_hash[:name]
    @kindergarten_participation = data_hash[:kindergarten_participation]
  end

  def kindergarten_participation_by_year
    part_values = @kindergarten_participation.values
    cleaned = []
    part_values.each do |year|
      cleaned << (year * 1000).floor / 1000.0
    end
    @kindergarten_participation.keys.zip(cleaned).to_h
    binding.pry
  end

  def kindergarten_participation_in_year(year)
    binding.pry
    if @kindergarten_participation.key?(year)
      binding.pry
      kindergarten_participation_by_year[year]
    else
      nil
    end
  end

end
