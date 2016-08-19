#!/usr/bin/env ruby
# coding: utf-8

$PI = 3


class Shape

  attr_reader :area
  attr_reader :type
  attr_reader :type_weight

  def initialize(type, *args)
    @type = type
    @args = args.flatten
    @type_weight = 0
  end

  def area
    return is_valid ? send("#{@type}_area") : 0
  end

  def is_valid
    invalid = -1
    return !@args.include?(-1) && send("is_valid_#{@type}")
  end

  def to_s
    return "#{@type} #{@args.to_s} #{@type_weight}  area=#{@area} "
  end

  private
  def is_valid_trapezoid
    return @args[2] > @args[1]
  end

  def is_valid_circle
    return true
  end

  def is_valid_rectangle
    return true
  end

  def is_valid_triangle
    return true
  end

  def circle_area
    @type_weight = 255
    return @area = $PI * @args[0] * @args[0]
  end

  def rectangle_area
    @type_weight = 4
    return @area = @args[0] * @args[1]
  end

  def triangle_area
    @type_weight = 3
    return @area = @args[0] * @args[1] / 2
  end

  def trapezoid_area
    @type_weight = 5
    return @area = (@args[0] + @args[1]) * @args[2] / 2
  end

end


class ShapeSorter

  attr_reader :origin_shapes
  attr_reader :valid_shapes

  def initialize(file)
    read_shapes(file)
  end

  def read_shapes(file)
    @origin_shapes = Array.new
    @valid_shapes = Array.new
    open(file){|f|
      f.readlines.each{|item|
        item =~/(\d+)\s*(\w+)\s*([-\d+\s]*)/
        shape = eval("Shape.new(\"#{$2}\",#{$3.split(' ').join(',')})")
        @origin_shapes << {'id'=>$1, 'shape'=>shape}
        @valid_shapes << {'id'=>$1, 'shape'=>shape} if shape.is_valid
      }
    }
  end

  def cal_total_valid_area
    @total_valid_area = 0
    @valid_shapes.each{|shape|
      @total_valid_area += shape['shape'].area
    }
    return @total_valid_area
  end

  def comp(a, b)
    if a['shape'].area < b['shape'].area
      return 1
    elsif a['shape'].area  >b['shape'].area
      return -1
    else
      if a['shape'].type_weight <  b['shape'].type_weight
        return 1
      elsif a['shape'].type_weight > b['shape'].type_weight
        return -1
      end
      return 0
    end
  end

  def shape_sort(shapes)
    return shapes.sort{|a,b| comp(a,b)}
  end

end


ShapeSorter = ShapeSort.new('data.txt')
puts "total valid area is: #{shapeSort.cal_total_valid_area}\n"
puts "the sort of shape area is:\n"
puts shapeSort.shape_sort(shapeSort.valid_shapes)



