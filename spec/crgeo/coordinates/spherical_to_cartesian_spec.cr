require "../../spec_helper"

describe Crgeo::Coordinates::SphericalToCartesian do
  describe "#value" do
    context "when specific geographical points" do
      context "when zero point" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: 0).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(Crgeo::RADIUS, 0.001)
        end
      end

      context "when North Pole" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 90, lon: 0).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(Crgeo::RADIUS, 0.001)
          value[:z].should be_close(0, 0.001)
        end
      end

      context "when South Pole" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: -90, lon: 0).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(-Crgeo::RADIUS, 0.001)
          value[:z].should be_close(0, 0.001)
        end
      end
    end

    context "when equator" do
      context "when 30 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: 30).value

          value[:x].should be_close(Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when 45 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: 45).value

          value[:x].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when 60 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: 60).value

          value[:x].should be_close(Crgeo::RADIUS * Math.sqrt(3) / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when 90 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: 90).value

          value[:x].should be_close(Crgeo::RADIUS, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(0, 0.001)
        end
      end

      context "when 120 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: 120).value

          value[:x].should be_close(Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(-Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when 135 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: 135).value

          value[:x].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(-Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when 150 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: 150).value

          value[:x].should be_close(Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(-Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when 180 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: 180).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(-Crgeo::RADIUS, 0.001)
        end
      end

      context "when -30 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: -30).value

          value[:x].should be_close(-Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when -45 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: -45).value

          value[:x].should be_close(-Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when -60 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: -60).value

          value[:x].should be_close(-Crgeo::RADIUS * Math.sqrt(3) / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when -90 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: -90).value

          value[:x].should be_close(-Crgeo::RADIUS, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(0, 0.001)
        end
      end

      context "when -120 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: -120).value

          value[:x].should be_close(-Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(-Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when -135 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: -135).value

          value[:x].should be_close(-Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(-Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when -150 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: -150).value

          value[:x].should be_close(-Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(-Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when -180 lon" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 0, lon: -180).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(0, 0.001)
          value[:z].should be_close(-Crgeo::RADIUS, 0.001)
        end
      end
    end

    context "when zero meridian" do
      context "when 30 lat" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 30, lon: 0).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when 45 lat" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 45, lon: 0).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when 60 lat" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 60, lon: 0).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when -30 lat" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: -30, lon: 0).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(-Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when -45 lat" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: -45, lon: 0).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(-Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when -60 lat" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: -60, lon: 0).value

          value[:x].should be_close(0, 0.001)
          value[:y].should be_close(-Math.sqrt(3) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Crgeo::RADIUS / 2, 0.001)
        end
      end
    end

    context "when any points" do
      context "when lat 45, lon 45" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 45, lon: 45).value

          value[:x].should be_close(Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when lat 45, lon 135" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 45, lon: 135).value

          value[:x].should be_close(Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(-Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when lat 45, lon -45" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 45, lon: -45).value

          value[:x].should be_close(-Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when lat 45, lon -135" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: 45, lon: -135).value

          value[:x].should be_close(-Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(-Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when lat -45, lon 45" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: -45, lon: 45).value

          value[:x].should be_close(Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(-Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when lat -45, lon 135" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: -45, lon: 135).value

          value[:x].should be_close(Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(-Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(-Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when lat -45, lon -45" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: -45, lon: -45).value

          value[:x].should be_close(-Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(-Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(Crgeo::RADIUS / 2, 0.001)
        end
      end

      context "when lat -45, lon -135" do
        it do
          value = Crgeo::Coordinates::SphericalToCartesian.new(lat: -45, lon: -135).value

          value[:x].should be_close(-Crgeo::RADIUS / 2, 0.001)
          value[:y].should be_close(-Math.sqrt(2) * Crgeo::RADIUS / 2, 0.001)
          value[:z].should be_close(-Crgeo::RADIUS / 2, 0.001)
        end
      end
    end
  end
end
