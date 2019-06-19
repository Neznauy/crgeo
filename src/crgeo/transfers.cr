require "./transfers/**"

module Crgeo
  module Transfers
    def self.grad_to_rad(grad : Float64) : Float64
      Crgeo::Transfers::GradToRad.new(grad).value
    end

    def self.rad_to_grad(rad : Float64) : Float64
      Crgeo::Transfers::RadToGrad.new(rad).value
    end

    def self.spherical_to_cartesian(lat : Float64, lon : Float64) : NamedTuple(x: Float64, y: Float64, z: Float64)
      Crgeo::Transfers::SphericalToCartesian.new(lat: lat, lon: lon).value
    end

    def self.cartesian_to_spherical(x : Float64, y : Float64, z : Float64) : NamedTuple(lat: Float64, lon: Float64)
      Crgeo::Transfers::CartesianToSpherical.new(x: x, y: y, z: z).value
    end
  end
end
