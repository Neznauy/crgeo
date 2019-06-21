require "../spec_helper"

describe Crgeo::Angle do
  describe "#value" do
    context "when different points" do
      it do
        klass = Crgeo::Angle.new(lat1: 90, lon1: 0, lat2: 0, lon2: 90, lat: 0, lon: 0)
        klass.value.should be_close(Math::PI / 2, 0.00001)
      end
    end

    context "when 1st ans 2nd are the same" do
      it do
        klass = Crgeo::Angle.new(lat1: 0, lon1: 60, lat2: 0, lon2: 60, lat: 0, lon: 90)
        klass.value.should be_close(0, 0.00001)
      end
    end

    context "when poins on single line" do
      it do
        klass = Crgeo::Angle.new(lat1: 0, lon1: 60, lat2: 0, lon2: 120, lat: 0, lon: 90)
        klass.value.should be_close(Math::PI, 0.00001)
      end
    end
  end
end
