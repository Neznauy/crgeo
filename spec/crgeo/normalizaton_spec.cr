require "../spec_helper"

describe Crgeo::Normalization do
  describe "#value" do
    context "when distance < 1000m" do
      it do
        value = Crgeo::Normalization.new(
          lat1: 59.92878, lon1: 30.412105, lat2: 59.929113, lon2: 30.411852, lat: 59.9287805, lon: 30.4121053
        ).value

        value[:lat].should be_close(59.928780, 0.000001)
        value[:lon].should be_close(30.412104, 0.000001)
      end
    end

    context "when distance is about 1000km" do
      it do
        value = Crgeo::Normalization.new(
          lat1: 38.876009, lon1: -48.197507, lat2: 38.815474, lon2: -29.070596, lat: 46.571191, lon: -15.820338
        ).value

        value[:lat].should be_close(37.466342, 0.000001)
        value[:lon].should be_close(-18.786321, 0.000001)
      end
    end

    context "when sphere center and points on single straight" do
      it do
        expect_raises(Crgeo::InvalidCoordinates) do
          Crgeo::Normalization.new(lat1: 0, lon1: 0, lat2: 0, lon2: 180, lat: 46.571191, lon: -15.820338).value
        end
      end
    end

    context "when pole to equator plane" do
      context "when North" do
        it do
          expect_raises(Crgeo::InvalidCoordinates) do
            Crgeo::Normalization.new(lat1: 0, lon1: 0, lat2: 0, lon2: 179, lat: 90, lon: -15.820338).value
          end
        end
      end

      context "when South" do
        it do
          expect_raises(Crgeo::InvalidCoordinates) do
            Crgeo::Normalization.new(lat1: 0, lon1: 0, lat2: 0, lon2: 179, lat: -90, lon: -15.820338).value
          end
        end
      end
    end 
  end
end
