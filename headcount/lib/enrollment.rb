class Enrollment
attr_reader :name, :kindergarten_participation_by_year
  def initialize(data_hash)
    @name = data_hash[:name]
    @kindergarten_participation_by_year = clean_year(data_hash[:kindergarten_participation])
  end

  def kindergarten_participation_in_year(year)
    if @kindergarten_participation_by_year.key?(year)
      @kindergarten_participation_by_year[year]
    else
      nil
    end
  end

  def clean_year(years)
    cleaner_years = years.values
    cleaned = []
    cleaner_years.each do |year|
      cleaned << (year * 1000).floor / 1000.0
    end
    years.keys.zip(cleaned).to_h
  end
end
