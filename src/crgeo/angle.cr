module Crgeo
  class Angle
    getter lat1 : Float64
    getter lon1 : Float64
    getter lat2 : Float64
    getter lon2 : Float64
    getter lat  : Float64
    getter lon  : Float64

    def initialize(lat1 : Float64, lon1 : Float64, lat2 : Float64, lon2 : Float64, lat : Float64, lon : Float64)
      @lat1 = lat1
      @lon1 = lon1
      @lat2 = lat2
      @lon2 = lon2
      @lat  = lat
      @lon  = lon
    end

    def value : Float64
      validate_coordinates!

      prepared_lat1 = Crgeo::Transfers.grad_to_rad(lat1)
      prepared_lon1 = Crgeo::Transfers.grad_to_rad(lon1)
      prepared_lat2 = Crgeo::Transfers.grad_to_rad(lat2)
      prepared_lon2 = Crgeo::Transfers.grad_to_rad(lon2)
      prepared_lat  = Crgeo::Transfers.grad_to_rad(lat)
      prepared_lon  = Crgeo::Transfers.grad_to_rad(lon)

      a = central_angle(lat_1: prepared_lat1, lon_1: prepared_lon1, lat_2: prepared_lat2, lon_2: prepared_lon2)
      b = central_angle(lat_1: prepared_lat, lon_1: prepared_lon, lat_2: prepared_lat1, lon_2: prepared_lon1)
      c = central_angle(lat_1: prepared_lat, lon_1: prepared_lon, lat_2: prepared_lat2, lon_2: prepared_lon2)

      Math.acos(((Math.cos(a) - Math.cos(b) * Math.cos(c)) / (Math.sin(b) * Math.sin(c))).round(5))
    end

    private def central_angle(lat_1 : Float64, lon_1 : Float64, lat_2 : Float64, lon_2 : Float64) : Float64
      Crgeo::Distance.new(
        lat1: Crgeo::Transfers.rad_to_grad(lat_1),
        lon1: Crgeo::Transfers.rad_to_grad(lon_1),
        lat2: Crgeo::Transfers.rad_to_grad(lat_2),
        lon2: Crgeo::Transfers.rad_to_grad(lon_2)
      ).value / Crgeo.radius
    end

    private def validate_coordinates!
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat, lon: lon)
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat1, lon: lon1)
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat2, lon: lon2)
    end
  end
end
