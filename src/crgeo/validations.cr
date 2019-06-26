require "./validations/**"

module Crgeo
  module Validations
    def self.spherical_coordinates(lat : Float64, lon : Float64) : Bool
      Crgeo::Validations::SphericalCoordinates.new(lat: lat, lon: lon).valid?
    end

    def self.cartesian_coordinates(x : Float64, y : Float64, z : Float64, precision = 0.01) : Bool
      Crgeo::Validations::CartesianCoordinates.new(x: x, y: y, z: z, precision: precision).valid?
    end
  end
end
