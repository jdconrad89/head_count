module Truncate
  def clean(input)
    zippy = []
    if input == nil
      nil
    elsif input.class == Float
      (input * 1000).floor / 1000.0
    else
      input.each do |num|
        zippy << (num[1] * 1000).floor / 1000.0
      end
      @kindergarten_participation.keys.zip(zippy).to_h
    end
  end
end
