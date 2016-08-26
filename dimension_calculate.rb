#!/usr/bin/env ruby
# coding: utf-8

class Shape
  attr_reader :weight
  attr_reader :dimension

  def initialize
    @weight = 0
    @dimension = 0
  end
  def is_valid
  end
  def dimension_calculate
  end

end

class Circle < Shape
  attr_reader :radius

  def initialize (radius)
    @radius = radius
    super()
    @weight = 255
  end
  def dimension_calculate
    @dimension = 3 * @radius * @radius
  end
  def is_valid
    return @radius > 0
  end
end

class Triangle < Shape
  attr_reader :width
  attr_reader :height

  def initialize (width, height)
    @width = width
    @height = height
    super()
    @weight = 3
    is_valid ? dimension_calculate : 0
  end
  def dimension_calculate
    @dimension  = width * height / 2
  end
  def is_valid
    return @width > 0 && @height > 0
  end
end

class Rectangle < Shape
  attr_reader :width
  attr_reader :height

  def initialize (width, height)
    @width = width
    @height = height
    super()
    @weight = 4
  end

  def dimension_calculate
    @dimension  = width * height
  end

  def is_valid
    return (@width && @height) > 0
  end
end

class Trapezoid < Shape
  attr_reader :top
  attr_reader :bottom
  attr_reader :height

  def initialize (top, bottom, height)
    @top = top
    @bottom = bottom
    @height = height
    super()
    @weight = 5
  end

  def dimension_calculate
    @dimension  = (top + bottom) * height / 2
  end
  def is_valid
    return (@width && @height && @top) > 0 && (@top < @bottom)
  end
end

class DataProcess
  attr_reader :file
  attr_reader :shapes

  def initialize (file)
    @file = file
    @shapes = Array.new
  end
  def data_parse
    open(@file){|f|
      f.readlines.each{|item|
        item =~/(\d+)\s*(\w+)\s*([-\d+\s]*)/
        id = $1
        type = $2
        info = $3.split(' ').join(',')
        shape_class = eval("#{type.capitalize}.new(#{info})")
        @shapes << {"id" => id, "info" => shape_class}
      }
      puts @shapes
    }
  end
  def total_dimension_calculate
    @total_dimension = @shapes["info"]
    @shapes.each{|s|
      puts s["info"]
      @total_dimension += s["info"].dimension
    }
    puts @total_dimension
  end
end





shapes_of_circle = DataProcess.new('data.txt')
shapes_of_circle.data_parse
