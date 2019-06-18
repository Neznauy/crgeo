module Crgeo
  module Transfers
    class GradToRad
      getter grad : Float64

      def initialize(grad : Float64)
        @grad = grad
      end

      def value : Float64
        grad * Math::PI / 180
      end
    end
  end
end
