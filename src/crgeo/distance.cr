module Crgeo
  class Distance
    getter lat1 : Float64
    getter lon1 : Float64
    getter lat2 : Float64
    getter lon2 : Float64

    def initialize(lat1 : Float64, lon1 : Float64, lat2 : Float64, lon2 : Float64)
      @lat1 = lat1
      @lon1 = lon1
      @lat2 = lat2
      @lon2 = lon2
    end

    def value : Float64
      validate_coordinates!

      prepared_lat1 = Crgeo::Transfers.deg_to_rad(lat1)
      prepared_lon1 = Crgeo::Transfers.deg_to_rad(lon1)
      prepared_lat2 = Crgeo::Transfers.deg_to_rad(lat2)
      prepared_lon2 = Crgeo::Transfers.deg_to_rad(lon2)

      delta_lat = prepared_lat2 - prepared_lat1
      delta_lon = prepared_lon2 - prepared_lon1

      a = (Math.sin(delta_lat / 2))**2 + Math.cos(prepared_lat1) * (Math.sin(delta_lon / 2))**2 * Math.cos(prepared_lat2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

      c * Crgeo.radius
    end

    private def validate_coordinates!
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat1, lon: lon1)
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat2, lon: lon2)
    end
  end
end
