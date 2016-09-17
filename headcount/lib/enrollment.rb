require_relative "enrollment_repository"

class Enrollment
attr_reader :name, :kindergarten_participation
  def initialize(data_hash)
    @name = data_hash[:name]
    @kindergarten_participation = data_hash[:kindergarten_participation]
  end

  def kindergarten_participation_by_year
    if @kindergarten_participation.class == String
      participation = @kindergarten_participation.to_f
    else
      participation = @kindergarten_participation.values
    end
    part_values = participation
    cleaned = []
    binding.pry
    if part_values.class != Float
      part_values.each do |year|
        cleaned << (year * 1000).floor / 1000.0
      end
    end
    if @kindergarten_participation.class != String
      @kindergarten_participation.keys.zip(cleaned).to_h
    end
    # binding.pry
  end

  def kindergarten_participation_in_year(year)
    # binding.pry
    if @kindergarten_participation.class == String
      @kindergarten_participation.to_f
      kindergarten_participation_by_year[year]
    elsif @kindergarten_participation.key?(year)
      # binding.pry
      kindergarten_participation_by_year[year]
    else
      nil
    end
  end

end
