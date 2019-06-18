module Crgeo
  module Coordinates
    class SphericalToCartesian
      getter lat : Float64
      getter lon : Float64

      def initialize(lat : Float64, lon : Float64)
        @lat = Math::PI / 2 - Crgeo::Coordinates.grad_to_rad(lat)
        @lon = Crgeo::Coordinates.grad_to_rad(lon)
      end

      #   y
      #   |__x
      #  /z
      def value : NamedTuple(x: Float64, y: Float64, z: Float64)
        {
          x: Crgeo::RADIUS * Math.sin(lat) * Math.sin(lon),
          y: Crgeo::RADIUS * Math.cos(lat),
          z: Crgeo::RADIUS * Math.sin(lat) * Math.cos(lon)
        }
      end
    end
  end
end
