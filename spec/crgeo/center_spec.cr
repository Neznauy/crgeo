require "../spec_helper"

describe Crgeo::Center do
  describe "#value" do
    context "when 2 points" do
      it do
        value = Crgeo::Center.new([{lat: 0.0, lon: 0.0}, {lat: 0.0, lon: 1.0}]).value
        value[:lat].should be_close(0.0, 0.000001)
        value[:lon].should be_close(0.5, 0.000001)
      end
    end

    context "when 4 points" do
      it do
        value = Crgeo::Center.new([{lat: 0.0, lon: 0.0}, {lat: 0.0, lon: 1.0}, {lat: 1.0, lon: 0.0}, {lat: 1.0, lon: 1.0}]).value
        value[:lat].should be_close(0.5, 0.000001)
        value[:lon].should be_close(0.5, 0.000001)
      end
    end

    context "when point with invalid coordinate" do
      it do
        expect_raises(Crgeo::InvalidCoordinates) do
          Crgeo::Center.new([{lat: 0.0, lon: 0.0}, {lat: 90.1, lon: 1.0}]).value
        end
      end
    end
  end
end
