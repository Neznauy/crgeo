require "./coordinates/**"

module Crgeo
  module Coordinates
    def self.grad_to_rad(grad : Float64) : Float64
      Crgeo::Coordinates::GradToRad.new(grad).value
    end

    def self.rad_to_grad(rad : Float64) : Float64
      Crgeo::Coordinates::RadToGrad.new(rad).value
    end

    def self.spherical_to_cartesian(lat : Float64, lon : Float64) : NamedTuple(x: Float64, y: Float64, z: Float64)
      Crgeo::Coordinates::SphericalToCartesian.new(lat: lat, lon: lon).value
    end
  end
end
