require_relative "enrollment_repository"

class Enrollment
attr_reader :name, :kindergarten_participation, :year
  def initialize(data_hash)
    @name = data_hash[:name]
    @kindergarten_participation = data_hash[:kindergarten_participation]
    @year = data_hash[:year]
  end

  def kindergarten_participation_by_year
    binding.pry
    if @kindergarten_participation.class == String
      participation = @kindergarten_participation.to_f
    else
      participation = @kindergarten_participation.values
    end
    binding.pry
    part_values = participation
    cleaned = []
    if part_values.class == Float
      cleaned << (part_values * 1000).floor / 1000.0
      binding.pry
    else
      binding.pry
      part_values.each do |year|
        cleaned << (year * 1000).floor / 1000.0
      end
      binding.pry
    end
    if @kindergarten_participation.class != String
      binding.pry
      @kindergarten_participation.keys.zip(cleaned).to_h
    end
    # binding.pry
  end

  def kindergarten_participation_in_year(year)
    binding.pry
    if @kindergarten_participation.class == String
      cleaned = []
      participation = @kindergarten_participation.to_f
      cleaned << (participation * 1000).floor / 1000.0

      binding.pry

    elsif @kindergarten_participation.key?(year)
      binding.pry
      kindergarten_participation_by_year[year]
    else
      nil
    end
  end

end
