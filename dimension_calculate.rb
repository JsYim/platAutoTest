#!/usr/bin/env ruby
# coding: utf-8

require_relative 'global'

class Shape
  attr_reader :type
  attr_reader :weight
  attr_reader :dimension

  def initialize (type, weight, dimension)
    @type = type
    @weight = $INITIAL
    @dimension = $INITIAL
  end

  def is_valid
  end

  def dimension_calculate
  end

  def to_s
    puts "type: #{@type}  weight: #{@weight}  dimension: #{@dimension}"
  end

end

class Circle < Shape
  attr_reader :radius

  def initialize (type, radius)
    super(type, weight, dimension)
    @radius = radius
    @weight = $CIRCLE
  end

  def dimension_calculate
    @dimension = $PI * @radius * @radius
  end

  def is_valid
    true
  end

  def to_s
    super
  end
end

class Triangle < Shape
  attr_reader :width
  attr_reader :height

  def initialize (type, width, height)
    super(type, weight, dimension)
    @width = width
    @height = height
  end

  def dimension_calculate
     @dimension  = width.to_i * height.to_i / 2
  end

  def is_valid
     true
  end
  def to_s
    super
  end
end

class Rectangle < Shape
  attr_reader :width
  attr_reader :height

  def initialize (type, width, height)
    super(type, weight, dimension)
    @width = width
    @height = height
    @weight = $RECTANGLE
  end

  def dimension_calculate
     @dimension  = width* height
  end

  def is_valid
     true
  end
  def to_s
    super
  end
end

class Trapezoid < Shape
  attr_reader :top
  attr_reader :bottom
  attr_reader :height

  def initialize (type, top, bottom, height)
    @top = top
    @bottom = bottom
    @height = height
    @weight = $TRAPEZOID
  end

  def dimension_calculate
    @dimension  = (top + bottom) * height / 2
  end

  def is_valid
    true
  end
  def to_s
    super
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
      shape_class = eval("#{type.capitalize}.new(\"#{type}\",#{info})")

      # shape_dimension = shape_init.dimension_calculate
      @shapes = {"id" => id, "info" => shape_class}

    }
  }
  end
  #
  def total_dimension_calculate
    @total_dimension = @shapes["info"].dimension_calculate


    @shapes.each{|s|
      puts s["info"]
      @total_dimension += shape["info"].dimension_calculate
    }
    puts @total_dimension
  end
end





shapes_of_circle = DataProcess.new('testfile')
shapes_of_circle.data_parse
shapes_of_circle.total_dimension_calculate


