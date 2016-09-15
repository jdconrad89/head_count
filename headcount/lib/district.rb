class District
attr_accessor :name
  def initialize(data_hash)
    @name = data_hash[:name]
  end

end
