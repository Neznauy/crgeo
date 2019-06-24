module Crgeo
  class Bearing
    getter lat1 : Float64
    getter lon1 : Float64
    getter lat2 : Float64
    getter lon2 : Float64

    def initialize(lat1 : Float64, lon1 : Float64, lat2 : Float64, lon2 : Float64)
      @lat1 = Crgeo::Transfers.grad_to_rad(lat1)
      @lon1 = Crgeo::Transfers.grad_to_rad(lon1)
      @lat2 = Crgeo::Transfers.grad_to_rad(lat2)
      @lon2 = Crgeo::Transfers.grad_to_rad(lon2)
    end

    def value : Float64
      x = Math.cos(lat1) * Math.sin(lat2) - Math.sin(lat1) * Math.cos(lat2) * Math.cos(lon2 - lon1)
      y = Math.sin(lon2 - lon1) * Math.cos(lat2)

      bearing = Crgeo::Transfers.rad_to_grad(Math.atan2(y,x))

      bearing < 0 ? bearing + 360 : bearing
    end
  end
end
