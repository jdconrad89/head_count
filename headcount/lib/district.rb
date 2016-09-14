class District
attr_reader :name
  def initialize(data_hash)
    @name = data_hash[:name]
  end

end
