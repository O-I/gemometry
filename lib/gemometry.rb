module Geometry
  class Triangle
    attr_accessor :sideA, :sideB, :sideC

    def initialize(side1, side2, side3)
      @sideA = side1.to_f
      @sideB = side2.to_f
      @sideC = side3.to_f
    end

    def perimeter
      @sideA + @sideB + @sideC
    end

    def area
      p = self.perimeter / 2
      Math.sqrt(p * (p - @sideA) * (p - @sideB) * (p - @sideC))
    end

    def angles 
      [ law_of_cosines(sideA, sideB, sideC),
        law_of_cosines(sideC, sideA, sideB), 
        law_of_cosines(sideB, sideC, sideA) ]
    end

    def valid?
      (sideA < sideB + sideC) && (sideB < sideA + sideC) && (sideC < sideA + sideB)
    end

    private

    def law_of_cosines(a, b, c)
      Math.acos((a**2 + b**2 - c**2) / (2*a*b)) * (180 / Math::PI)

      # cos = ((a**2 + b**2 - c**2) / (2*a*b))
      # (Math.acos(cos) / (Math::PI / 180)).round(2)
    end
  end

  class Rectangle
    attr_accessor :length, :width

    def initialize(length, width)
      @length = length.to_f
      @width = width.to_f
    end

    def perimeter
      2 * (@length + @width)
    end

    def area
      @length * @width
    end
  end

  class Circle
    attr_accessor :radius

    def initialize(radius)
      @radius = radius.to_f
    end

    def circumference
      2 * @radius * Math::PI
    end

    def area
      Math::PI * @radius ** 2
    end
  end
end