require "../spec_helper"

describe Crgeo::Bearing do
  describe "#value" do
    context "when direct" do
      it do
        klass = Crgeo::Bearing.new(lat1: 50.0, lon1: -85.0, lat2: 40.750354, lon2: -73.993371)
        klass.value.should be_close(136.05, 0.01)
      end
    end

    context "when reverse" do
      it do
        klass = Crgeo::Bearing.new(lat1: 40.750354, lon1: -73.993371, lat2: 50.0, lon2: -85.0)
        klass.value.should be_close(323.92, 0.01)
      end
    end

    context "when single meridian" do
      it do
        klass = Crgeo::Bearing.new(lat1: 40.750354, lon1: -73.993371, lat2: 50.0, lon2: -73.993371)
        klass.value.should be_close(0, 0.01)
      end
    end

    context "when equator" do
      it do
        klass = Crgeo::Bearing.new(lat1: 0, lon1: -73.993371, lat2: 0, lon2: -50)
        klass.value.should be_close(90, 0.01)
      end
    end

    context "when invalid" do
      it do
        expect_raises(Crgeo::InvalidCoordinates) do
          Crgeo::Bearing.new(lat1: 91, lon1: -73.993371, lat2: 0, lon2: -50).value
        end
      end
    end
  end
end
