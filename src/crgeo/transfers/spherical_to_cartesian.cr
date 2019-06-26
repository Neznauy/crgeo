module Crgeo
  module Transfers
    class SphericalToCartesian
      getter lat : Float64
      getter lon : Float64

      def initialize(lat : Float64, lon : Float64)
        @lat = lat
        @lon = lon
      end

      #   y
      #   |__x
      #  /z
      def value : NamedTuple(x: Float64, y: Float64, z: Float64)
        validate_coordinates!

        prepared_lat = Math::PI / 2 - Crgeo::Transfers.grad_to_rad(lat)
        prepared_lon = Crgeo::Transfers.grad_to_rad(lon)

        {
          x: Crgeo.radius * Math.sin(prepared_lat) * Math.sin(prepared_lon),
          y: Crgeo.radius * Math.cos(prepared_lat),
          z: Crgeo.radius * Math.sin(prepared_lat) * Math.cos(prepared_lon)
        }
      end

      private def validate_coordinates!
        raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat, lon: lon)
      end
    end
  end
end
