module Crgeo
  module Transfers
    class CartesianToSpherical
      getter x : Float64
      getter y : Float64
      getter z : Float64

      def initialize(x : Float64, y : Float64, z : Float64)
        @x = x
        @y = y
        @z = z
      end

      def value : NamedTuple(lat: Float64, lon: Float64)
        {
          lat: Crgeo::Transfers.rad_to_grad(Math::PI / 2 - Math.acos(y / Math.sqrt(x**2 + y**2 + z**2))),
          lon: Crgeo::Transfers.rad_to_grad(Math.atan2(x, z))
        }
      end
    end
  end
end
