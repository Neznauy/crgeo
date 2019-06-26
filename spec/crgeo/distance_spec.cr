require "../spec_helper"

describe Crgeo::Distance do
  describe "#value" do
    context "when different points" do
      it do
        klass = Crgeo::Distance.new(lat1: 59.975031, lon1: 30.317386, lat2: 59.977222, lon2: 30.314992)
        klass.value.should be_close(277.66, 0.01)
      end
    end

    context "when same points" do
      it do
        klass = Crgeo::Distance.new(lat1: 59.975031, lon1: 30.317386, lat2: 59.975031, lon2: 30.317386)
        klass.value.should be_close(0, 0.01)
      end
    end

    context "half of meridian" do
      it do
        klass = Crgeo::Distance.new(lat1: 0, lon1: 0, lat2: 90, lon2: 0)
        klass.value.should be_close(Math::PI * Crgeo.radius / 2, 0.01)
      end
    end

    context "half of equator" do
      it do
        klass = Crgeo::Distance.new(lat1: 0, lon1: 0, lat2: 0, lon2: 180)
        klass.value.should be_close(Math::PI * Crgeo.radius, 0.01)
      end
    end

    context "when invalid" do
      it do
        expect_raises(Crgeo::InvalidCoordinates) do
          Crgeo::Distance.new(lat1: 0, lon1: 0, lat2: 0, lon2: 181).value
        end
      end
    end
  end
end
