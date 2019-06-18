module Crgeo
  class Distance
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
      delta_lat = lat2 - lat1
      delta_lon = lon2 - lon1

      a = (Math.sin(delta_lat / 2))**2 + Math.cos(lat1) * (Math.sin(delta_lon / 2))**2 * Math.cos(lat2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

      c * Crgeo::RADIUS
    end
  end
end
