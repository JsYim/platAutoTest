#!/usr/bin/env ruby
# coding: utf-8

$invalid = -1
$initial = 0
$pi = 3
$triangle = 3
$rectangle = 4
$trapezoid = 5
$circle = 255

class Shape
  attr_reader :type
  attr_reader :weight
  attr_reader :dimension

  # 没有用到的参数没必要写，也无需传进来，
  # 不是很理解你的三个参数之间的关系，至少从命名上不容易理解

=begin
  设计的时候考虑到类型、面积和权重是三个公共参数，所以在父类里定义了，但是父类又确实没有用到，所以这块不知如何处理。
  疑问：如果父类不初始化这些参数的话，难道每个子类都要定义一遍，再分别实现吗？
  
  #既然没有用到，那就没必要传，传进来的值必须是有用的。父类定义了的属性和方法，子类都会继承，可以根据需要重新对这些属性赋值
=end

  def initialize (type, weight, dimension)
    @type = type
    @weight = $initial
    @dimension = $initial
  end

  # 此处为公共方法，应该有公共的实现，下面子类有不同的实现需求再重写此方法
=begin
    解答：OK，这里可以加上判断输入值是否小于0
=end

  def is_valid
  end

  def dimension_calculate
  end

  # 打印不要放在这里，会导致返回为空，需改为return
=begin
    解答：改为return后会有提示“Unnecessary return statements”
	这种提示就看个人了，我觉得有return代码更清晰些
=end

  def to_s
    return "type: #{@type}  weight: #{@weight}  dimension: #{@dimension}"
  end

end

class Circle < Shape
  attr_reader :radius

  def initialize (type, radius)
    super(type, weight, dimension)  #有俩空参数
    @radius = radius
    @weight = $circle               #此处我觉得不需要用到全局变量
  end

=begin
    1、空参数的话我是想直接继承父类……
    2、疑问：在Circle里定义一个本地变量也可以，但是为什么不能用全局变量呢？全局变量的使用有没有什么建议……
	
	ruby里面 全局变量一般就用配置文件代替了。
	你可以在父类定义，子类会继承父类所有方法和类变量。因此只需要在父类里面定义就OK了。
=end


  def dimension_calculate
    @dimension = $pi * @radius * @radius
  end

  #默认实现，无需重写
  def is_valid
    true
  end

  #默认实现，无需重写
  def to_s
    super
  end
end

#同上
class Triangle < Shape
  attr_reader :width
  attr_reader :height

  def initialize (type, width, height)
    super(type, weight, dimension)
    @width = width
    @height = height
    @weight = $triangle
  end

  def dimension_calculate
    @dimension  = @width * @height / 2    #最好加上@表示其为类变量
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
    @weight = $rectangle
  end

  def dimension_calculate
    @dimension  = width * height
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
    @weight = $trapezoid
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
    @shapes = Hash.new
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
        # @shapes = {"id" => id, "info" => shape_class}                # 此处赋值错误 ，将hash赋值给@shapes，shapes就变成了hash，建议了解Hash和Array的区别
        @shapes << {"id" => id, "info" => shape_class}
        # puts @shapes["info"]                                           #
        puts shape_class.dimension_calculate

=begin
    疑问：
    这里我非常想不通。为什么你使用：@origin_shapes << {'id'=>$1, 'shape'=>shape}就没有类型转换的错误啊？（没看出来和我代码的区别） 
    我也想把它设置成一个哈希数组，但是失败了……
	
	符号不一样呀 一个是<< 一个是 =
=end




      }
    }
  end
  # 打印需要放在外围
  def total_dimension_calculate
    @total_dimension = 0

    @shapes.each{|s|

      #@total_dimension += shape["info"].dimension_calculate   # 自己定义的变量都不使用...
=begin
    疑问：你说的定义的变量是指什么……是Shape类里定义的@dimension吗？
    这里我又感觉到有问题了，我虽然在Shape类里定义了@dimension，但是感觉没啥用，计算面积每次都得调用dimension_calculate
    难道一开始就没必要定义？
	
	我指的是你each{|s|} 定义的是s，用的是shape....
=end
      @total_dimension += s["info"].dimension_calculate  #
    }
    puts @total_dimension
  end
end





shapes_of_circle = DataProcess.new('data.txt')
shapes_of_circle.data_parse
shapes_of_circle.total_dimension_calculate
