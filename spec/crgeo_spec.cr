require "./spec_helper"

describe Crgeo do
  describe "EARTH_RADIUS" do
    it { Crgeo::EARTH_RADIUS.should eq 6_371_000 }
  end

  describe "#distance_between" do
    context "when different points" do
      it do
        Crgeo.distance_between(lat1: 59.975031, lon1: 30.317386, lat2: 59.977222, lon2: 30.314992)
          .should be_close(277.66, 0.01)
      end
    end

    context "when same points" do
      it do
        Crgeo.distance_between(lat1: 59.975031, lon1: 30.317386, lat2: 59.975031, lon2: 30.317386)
          .should be_close(0, 0.01)
      end
    end

    context "half of meridian" do
      it do
        Crgeo.distance_between(lat1: 0, lon1: 0, lat2: 90, lon2: 0).should be_close(Math::PI * Crgeo.radius / 2, 0.01)
      end
    end

    context "half of equator" do
      it do
        Crgeo.distance_between(lat1: 0, lon1: 0, lat2: 0, lon2: 180).should be_close(Math::PI * Crgeo.radius, 0.01)
      end
    end
  end

  describe "#lat_distance" do
    it { Crgeo.lat_distance.should be_close(111194.92, 0.01) }
  end

  describe "#lon_distance" do
    context "when equator" do
      it { Crgeo.lon_distance(0).should be_close(111194.92, 0.01) }
    end

    context "when South Pole" do
      it { Crgeo.lon_distance(-90).should be_close(0, 0.01) }
    end

    context "when North Pole" do
      it { Crgeo.lon_distance(90).should be_close(0, 0.01) }
    end

    context "when 60 lat" do
      it { Crgeo.lon_distance(60).should be_close(55597.46, 0.01) }
    end
  end

  describe "#radius" do
    context "when default" do
      it { Crgeo.radius.should eq 6_371_000 }
    end

    context "when set" do
      it do 
        Crgeo.radius = 100.0
        Crgeo.radius.should eq 100
      end
    end
  end
end
