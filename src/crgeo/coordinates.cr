require "./coordinates/**"

module Crgeo
  module Coordinates
    def self.grad_to_rad(grad : Float64) : Float64
      Crgeo::Coordinates::GradToRad.new(grad).value
    end

    def self.rad_to_grad(rad : Float64) : Float64
      Crgeo::Coordinates::RadToGrad.new(rad).value
    end
  end
end
