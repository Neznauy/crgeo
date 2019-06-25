require "./validations/**"

module Crgeo
  module Validations
    def self.spherical_coordinates(lat : Float64, lon : Float64) : Bool
      Crgeo::Validations::SphericalCoordinates.new(lat: lat, lon: lon).valid?
    end
  end
end
