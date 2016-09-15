class District
attr_accessor :name, :kindergarten_participation
  def initialize(data_hash)
    @name = data_hash[:name]
    @kindergarten_participation = data_hash[:kindergarten_participation]
  end

end
