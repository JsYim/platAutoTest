class Shape 
  attr_reader :sort
  attr_reader :dimension

  def initialize (sort, dimension)
    @sort = sort
    @dimension = dimension
  end
  def sort_print sort
    puts "Shape: @sort"
  end
  def dimension_calculate
    dimension = 0
  end
  def is_valid?

  end
end

class Circle < Shape
  attr_reader :radius
  def initialize (sort, radius)
  super(sort, dimension)
  @radius = radius
  end
  def sort_print
    puts "Circle:@sort"
  end
  def dimension_calculate
    dimension = 3 * radius * radius
    return dimension
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
    puts "Triangle:#@sort"
  end
  def dimension_calculate
    dimension = width * height / 2
    return dimension
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
    puts "Rectangle:#@sort"
  end

  def dimension_calculate
    dimension = width * height
    return dimension
  end

end

class DataProcess
  attr_reader :file
  def initialize file
    @file = file
  end
  def line_split
    lines = IO.readlines(file)

    tmp = lines[3].split(" ")

    shape = tmp[1]

    var1 = tmp[2].to_i

    var2 = tmp[3].to_i

    if shape == "circle"
      c = Circle.new(shape, var1)
      return c.dimension_calculate
    elsif shape == "triangle"
      t = Triangle.new(shape, var1, var2)
      return t.dimension_calculate
    elsif shape == "rectangle"
      r =  Rectangle.new(shape, var1, var2)
      return r.dimension_calculate
    else
      return 0
    end
  end
end

lines = DataProcess.new("data.txt")
xxx = lines.line_split
puts xxx

# shape = var[1]
# width = var[2]
# height = var[3]
# puts shape




#puts var[1]
# triangle = eval("shape.capitalize",new(shape, width, height))
# tri = Triangle.new(shape,width,height)
# circle.



