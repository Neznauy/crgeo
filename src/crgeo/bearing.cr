module Crgeo
  class Bearing
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

      prepared_lat1 = Crgeo::Transfers.grad_to_rad(lat1)
      prepared_lon1 = Crgeo::Transfers.grad_to_rad(lon1)
      prepared_lat2 = Crgeo::Transfers.grad_to_rad(lat2)
      prepared_lon2 = Crgeo::Transfers.grad_to_rad(lon2)

      delta_lon = prepared_lon2 - prepared_lon1

      x = Math.cos(prepared_lat1) * Math.sin(prepared_lat2) - Math.sin(prepared_lat1) * Math.cos(prepared_lat2) * Math.cos(delta_lon)
      y = Math.sin(delta_lon) * Math.cos(prepared_lat2)

      bearing = Crgeo::Transfers.rad_to_grad(Math.atan2(y,x))

      bearing < 0 ? bearing + 360 : bearing
    end

    private def validate_coordinates!
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat1, lon: lon1)
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat2, lon: lon2)
    end
  end
end
