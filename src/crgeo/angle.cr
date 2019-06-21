module Crgeo
  class Angle
    getter lat1 : Float64
    getter lon1 : Float64
    getter lat2 : Float64
    getter lon2 : Float64
    getter lat  : Float64
    getter lon  : Float64

    def initialize(lat1 : Float64, lon1 : Float64, lat2 : Float64, lon2 : Float64, lat : Float64, lon : Float64)
      @lat1 = Crgeo::Transfers.grad_to_rad(lat1)
      @lon1 = Crgeo::Transfers.grad_to_rad(lon1)
      @lat2 = Crgeo::Transfers.grad_to_rad(lat2)
      @lon2 = Crgeo::Transfers.grad_to_rad(lon2)
      @lat  = Crgeo::Transfers.grad_to_rad(lat)
      @lon  = Crgeo::Transfers.grad_to_rad(lon)
    end

    def value : Float64
      a = central_angle(lat_1: lat1, lon_1: lon1, lat_2: lat2, lon_2: lon2)
      b = central_angle(lat_1: lat, lon_1: lon, lat_2: lat1, lon_2: lon1)
      c = central_angle(lat_1: lat, lon_1: lon, lat_2: lat2, lon_2: lon2)

      Math.acos(((Math.cos(a) - Math.cos(b) * Math.cos(c)) / (Math.sin(b) * Math.sin(c))).round(5))
    end

    private def central_angle(lat_1 : Float64, lon_1 : Float64, lat_2 : Float64, lon_2 : Float64) : Float64
      Crgeo::Distance.new(
        lat1: Crgeo::Transfers.rad_to_grad(lat_1),
        lon1: Crgeo::Transfers.rad_to_grad(lon_1),
        lat2: Crgeo::Transfers.rad_to_grad(lat_2),
        lon2: Crgeo::Transfers.rad_to_grad(lon_2)
      ).value / Crgeo::RADIUS
    end
  end
end
