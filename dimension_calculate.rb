#!/usr/bin/env ruby
# coding: utf-8

$INVALID = -1
$INITIAL = 0
$PI = 3
$WEIGHT_OF_TRIANGLE = 3
$WEIGHT_OF_RECTANGLE = 4
$WEIGHT_OF_TRAPEZOID = 5
$WEIGHT_OF_CIRCLE = 255

class Shape
  attr_reader :type
  attr_reader :weight
  attr_reader :dimension

  def initialize
    @type = type
    @weight = $INITIAL
    @dimension = $INITIAL
  end

  def is_valid
    return 0
  end

  def dimension_calculate
    return 0
  end

  def to_s
    puts "#{@type}  #{@weight}  #{@dimension}"
  end

end

class Circle < Shape
  attr_reader :radius

  def initialize (type, radius)
    super()
    @radius = radius
    @weight = $WEIGHT_OF_CIRCLE
  end

  def dimension_calculate
    return @dimension = $PI * @radius * @radius
  end

  def is_valid
    return true
  end

  def to_s
    super
  end
end

class Triangle < Shape
  attr_reader :width
  attr_reader :height

  def initialize (type, width, height)
    super()
    @width = width
    @height = height
  end

  def dimension_calculate
    return @dimension  = width.to_i * height.to_i / 2
  end

  def is_valid
    return true
  end
  def to_s
    super
  end
end

class Rectangle < Shape
  attr_reader :width
  attr_reader :height

  def initialize (type, width, height)
    super()
    @width = width
    @height = height
    @weight = $WEIGHT_OF_RECTANGLE
  end

  def dimension_calculate
    return @dimension  = width* height
  end

  def is_valid
    return true
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
  end

  def dimension_calculate
    return @dimension  = (top + bottom) * height / 2
  end

  def is_valid
    return true
  end
  def to_s
    super
  end
end
