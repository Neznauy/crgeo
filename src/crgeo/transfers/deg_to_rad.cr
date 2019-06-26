module Crgeo
  module Transfers
    class DegToRad
      getter degree : Float64

      def initialize(degree : Float64)
        @degree = degree
      end

      def value : Float64
        degree * Math::PI / 180
      end
    end
  end
end
