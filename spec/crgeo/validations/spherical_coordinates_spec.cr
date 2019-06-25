require "../../spec_helper"

describe Crgeo::Validations::SphericalCoordinates do
  describe "#valid?" do
    context "when valid" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: 0, lon: 0)
        klass.valid?.should be_true
      end
    end

    context "when lat = 90" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: 90, lon: 0)
        klass.valid?.should be_true
      end
    end

    context "when lat > 90" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: 91, lon: 0)
        klass.valid?.should be_false
      end
    end

    context "when lat = -90" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: -90, lon: 0)
        klass.valid?.should be_true
      end
    end

    context "when lat < -90" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: -91, lon: 0)
        klass.valid?.should be_false
      end
    end

    context "when lon = 180" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: 0, lon: 180)
        klass.valid?.should be_true
      end
    end

    context "when lon > 180" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: 0, lon: 181)
        klass.valid?.should be_false
      end
    end

    context "when lon = -180" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: 0, lon: -180)
        klass.valid?.should be_true
      end
    end

    context "when lon < -180" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: 0, lon: -181)
        klass.valid?.should be_false
      end
    end

    context "when both invalid" do
      it do
        klass = Crgeo::Validations::SphericalCoordinates.new(lat: 91, lon: 181)
        klass.valid?.should be_false
      end
    end
  end
end
