module Crgeo
  module Validations
    class CartesianCoordinates
      getter x         : Float64
      getter y         : Float64
      getter z         : Float64
      getter precision : Float64

      def initialize(x : Float64, y : Float64, z : Float64, precision : Float64)
        @x         = x
        @y         = y
        @z         = z
        @precision = precision
      end

      def valid? : Bool
        coordinates_summ = Math.sqrt(x**2 + y**2 + z**2)

        ((Crgeo.radius - precision)..(Crgeo.radius + precision)).includes? coordinates_summ
      end
    end
  end
end
