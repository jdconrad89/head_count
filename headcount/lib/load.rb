# require 'csv'
# require 'pry'
#
#
#
# module Load
#
  # def load_data(file_hash)
  #   filename = file_hash[:enrollment][:kindergarten]
  #   contents = CSV.open filename, headers: true,
  #       header_converters: :symbol
  #   contents.each do |row|
  #     if find_by_name.nil?
  #       @districts[row[:location]] = District.new({name: row[:location] })
  #     end
  #   end
  #  end
  #
  #  def find_by_name(input)
  #    @districts[input]
  #  end
#
# end
