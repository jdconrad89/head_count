require_relative 'errors'

module Equations
  def clean(input)
    binding.pry
    @zippy = []
    if input == nil
      nil
    elsif input.class == Float
      (input * 1000).floor / 1000.0
    else
      input.each do |num|
        (num * 1000).floor / 1000.0
      end

    end
  end

  def average(input)
    (input.inject(:+)) / input.length
  end

  def error?(condition)
    raise UnknownDataError unless condition
  end


end
