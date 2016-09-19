class District
  attr_accessor :name, :kindergarten_participation, :enrollment
  def initialize(data_hash)
    @name = data_hash[:name]
    @enrollment = nil
  end
end
