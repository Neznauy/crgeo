module Crgeo
  module Transfers
    class RadToDeg
      getter rad : Float64

      def initialize(rad : Float64)
        @rad = rad
      end

      def value : Float64
        rad * 180 / Math::PI
      end
    end
  end
end
