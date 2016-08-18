class Shape
  attr_reader :sort
  attr_reader :dimension

  def initialize (sort, dimension)
    @sort = sort
    @dimension = dimension
  end
  def sort_print sort
    puts "Shape: " + @sort
  end
  def dimension_calculate
    @dimension = 0
  end
end

class Circle < Shape
  attr_reader :radius
  def initialize (sort, radius)
    super sort,dimension
    @radius = radius
  end
  def sort_print
    puts "Shape: " + @sort
  end
  def dimension_calculate
    @dimension = 3 * radius.to_i * radius.to_i
    puts "Dimension: #@dimension"
  end
end

class Triangle < Shape
  attr_reader :width
  attr_reader :height
  def initialize (sort, width, height)
    super(sort, dimension)
    @width = width
    @height = height
  end
  def sort_print
    puts "Shape: " + @sort
  end
  def dimension_calculate
    @dimension = width.to_i * height.to_i / 2
    puts "Dimension: #@dimension"
  end
end

class Rectangle < Shape
  attr_reader :width
  attr_reader :height
  def initialize (sort, width, height)
    super(sort, dimension)
    @width = width
    @height = height
  end

  def sort_print
    puts "Shape " + @sort
  end

  def dimension_calculate
    @dimension = width.to_i * height.to_i
    return @dimension
    puts "Dimension: #@dimension"
  end
end


require 'dimension_calculate.rb'

class DataProcess
  attr_reader :file
  attr_reader :shape
  def initialize file, shape
    @file = file
    @shape = shape
  end
  lines = IO.readlines("testfile")
  lines.each do |str|
    number, shape, r_w, h= str.chomp.split(" ")
    if shape == "circle"
      c = Circle.new(shape,r_w)
      c.sort_print
      c.dimension_calculate
    elsif shape == "triangle"
      t = Triangle.new(shape,r_w,h)
      t.sort_print
      t.dimension_calculate
    elsif shape == "rectangle"
      r = Rectangle.new(shape,r_w,h)
      r.sort_print
      r.dimension_calculate
    else
      puts "Invalid!"
    end
  end
end


