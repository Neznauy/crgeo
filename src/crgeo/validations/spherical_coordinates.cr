module Crgeo
  module Validations
    class SphericalCoordinates
      getter lat : Float64
      getter lon : Float64

      def initialize(lat : Float64, lon : Float64)
        @lat = lat
        @lon = lon
      end

      def valid? : Bool
        (-180..180).includes?(lon) && (-90..90).includes?(lat)
      end
    end
  end
end
