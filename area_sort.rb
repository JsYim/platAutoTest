
def graphic_sort(sort, parameter)
  if sort == "circle"
    dimension = cirlce_dimension(parameter)
    elsif sort == "triangle"
      dimension = trianlge_dimension(parameter)
      elsif sort
end

  else
    dimension =
  return dimension
end


def cirlce_dimension radius
  return  3 *radius * radius
end

def triangle_dimension radius
  return  3 *radius * radius
end


result = graphic_sort("circle",5)
puts ("Dimension: #{result}")
