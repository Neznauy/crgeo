require "./spec_helper"

describe Crgeo do
  describe "RADIUS" do
    it { Crgeo::RADIUS.should eq 6_371_000 }
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
        Crgeo.distance_between(lat1: 0, lon1: 0, lat2: 90, lon2: 0).should be_close(Math::PI * Crgeo::RADIUS / 2, 0.01)
      end
    end

    context "half of equator" do
      it do
        Crgeo.distance_between(lat1: 0, lon1: 0, lat2: 0, lon2: 180).should be_close(Math::PI * Crgeo::RADIUS, 0.01)
      end
    end
  end
end
