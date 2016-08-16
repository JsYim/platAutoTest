def graphic_dimension (sort, *var)
  if sort == "circle"
    dimension = cirlce_dimension(*var)
  elsif sort == "triangle"
    dimension = triangle_dimension(*var)
  elsif sort == "rectangle"
    dimension = rectangle_dimension(*var)
  else
    dimension = 0
  return dimension
  end
end

def cirlce_dimension radius
  return  3 *radius.to_i * radius.to_i
end

def triangle_dimension width, height
  return  width.to_i * height.to_i / 2
end

def rectangle_dimension width, height
  return  width.to_i* height.to_i
end

def graphic_dimension_sort dimension
  return dimension.sort
end
result = Array.new

result[0] = graphic_dimension("circle",5)
result[1]  = graphic_dimension("triangle", 5, 10)
result[2]  = graphic_dimension("rectangle", 8, 9)

final = graphic_dimension_sort(result)

puts ("Dimension of circle: #{result[0]}")
puts ("Dimension of triangle: #{result[1]}")
puts ("Dimension of rectangle: #{result[2]}")
puts ("Sort of graphic dimensions: #{final}")

arr = IO.readlines("testfile")
puts arr[0]
