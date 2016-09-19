module Truncate
  def clean(input)
    (input * 1000).floor / 1000.0
  end

end
