require "../../spec_helper"

describe Crgeo::Transfers::CartesianToSpherical do
  describe "#value" do
    context "when specific geographical points" do
      context "when zero point" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(x: 0.0, y: 0.0, z: Crgeo::RADIUS).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(0, 0.000001)
        end
      end

      context "when North Pole" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(x: 0.0, y: Crgeo::RADIUS, z: 0.0).value

          value[:lat].should be_close(90, 0.000001)
          value[:lon].should be_close(0, 0.000001)
        end
      end

      context "when South Pole" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(x: 0.0, y: -Crgeo::RADIUS, z: 0.0).value

          value[:lat].should be_close(-90, 0.000001)
          value[:lon].should be_close(0, 0.000001)
        end
      end
    end

    context "when equator" do
      context "when 30 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Crgeo::RADIUS / 2,
            y: 0.0,
            z: Math.sqrt(3) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(30, 0.000001) 
        end
      end

      context "when 45 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Math.sqrt(2) * Crgeo::RADIUS / 2,
            y: 0.0,
            z: Math.sqrt(2) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(45, 0.000001) 
        end
      end

      context "when 60 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Crgeo::RADIUS * Math.sqrt(3) / 2,
            y: 0.0,
            z: Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(60, 0.000001) 
        end
      end

      context "when 90 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(x: Crgeo::RADIUS, y: 0.0, z: 0.0).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(90, 0.000001)
        end
      end

      context "when 120 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Math.sqrt(3) * Crgeo::RADIUS / 2,
            y: 0.0,
            z: -Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(120, 0.000001)
        end
      end

      context "when 135 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Math.sqrt(2) * Crgeo::RADIUS / 2,
            y: 0.0,
            z: -Math.sqrt(2) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(135, 0.000001)
        end
      end

      context "when 150 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Crgeo::RADIUS / 2,
            y: 0.0,
            z: -Math.sqrt(3) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(150, 0.000001)
        end
      end

      context "when 180 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(x: 0.0, y: 0.0, z: -Crgeo::RADIUS).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(180, 0.000001)
        end
      end

      context "when -30 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Crgeo::RADIUS / 2,
            y: 0.0,
            z: Math.sqrt(3) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(-30, 0.000001)
        end
      end

      context "when -45 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Math.sqrt(2) * Crgeo::RADIUS / 2,
            y: 0.0,
            z: Math.sqrt(2) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(-45, 0.000001)
        end
      end

      context "when -60 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Crgeo::RADIUS * Math.sqrt(3) / 2,
            y: 0.0,
            z: Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(-60, 0.000001)
        end
      end

      context "when -90 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(x: -Crgeo::RADIUS, y: 0.0, z: 0.0).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(-90, 0.000001)
        end
      end

      context "when -120 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Math.sqrt(3) * Crgeo::RADIUS / 2,
            y: 0.0,
            z: -Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(-120, 0.000001)
        end
      end

      context "when -135 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Math.sqrt(2) * Crgeo::RADIUS / 2,
            y: 0.0,
            z: -Math.sqrt(2) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(-135, 0.000001)
        end
      end

      context "when -150 lon" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Crgeo::RADIUS / 2,
            y: 0.0,
            z: -Math.sqrt(3) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(0, 0.000001)
          value[:lon].should be_close(-150, 0.000001)
        end
      end
    end

    context "when zero meridian" do
      context "when 30 lat" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: 0.0,
            y: Crgeo::RADIUS / 2,
            z: Math.sqrt(3) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(30, 0.000001)
          value[:lon].should be_close(0, 0.000001)
        end
      end

      context "when 45 lat" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: 0.0,
            y: Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: Math.sqrt(2) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(45, 0.000001)
          value[:lon].should be_close(0, 0.000001)
        end
      end

      context "when 60 lat" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: 0.0,
            y: Math.sqrt(3) * Crgeo::RADIUS / 2,
            z: Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(60, 0.000001)
          value[:lon].should be_close(0, 0.000001)
        end
      end

      context "when -30 lat" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: 0.0,
            y: -Crgeo::RADIUS / 2,
            z: Math.sqrt(3) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(-30, 0.000001)
          value[:lon].should be_close(0, 0.000001)
        end
      end

      context "when -45 lat" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: 0.0,
            y: -Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: Math.sqrt(2) * Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(-45, 0.000001)
          value[:lon].should be_close(0, 0.000001)
        end
      end

      context "when -60 lat" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: 0.0,
            y: -Math.sqrt(3) * Crgeo::RADIUS / 2,
            z: Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(-60, 0.000001)
          value[:lon].should be_close(0, 0.000001)
        end
      end
    end

    context "when any points" do
      context "when lat 45, lon 45" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Crgeo::RADIUS / 2,
            y: Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(45, 0.000001)
          value[:lon].should be_close(45, 0.000001)
        end
      end

      context "when lat 45, lon 135" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Crgeo::RADIUS / 2,
            y: Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: -Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(45, 0.000001)
          value[:lon].should be_close(135, 0.000001)
        end
      end

      context "when lat 45, lon -45" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Crgeo::RADIUS / 2,
            y: Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(45, 0.000001)
          value[:lon].should be_close(-45, 0.000001)
        end
      end

      context "when lat 45, lon -135" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Crgeo::RADIUS / 2,
            y: Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: -Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(45, 0.000001)
          value[:lon].should be_close(-135, 0.000001)
        end
      end

      context "when lat -45, lon 45" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Crgeo::RADIUS / 2,
            y: -Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(-45, 0.000001)
          value[:lon].should be_close(45, 0.000001)
        end
      end

      context "when lat -45, lon 135" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: Crgeo::RADIUS / 2,
            y: -Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: -Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(-45, 0.000001)
          value[:lon].should be_close(135, 0.000001)
        end
      end

      context "when lat -45, lon -45" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Crgeo::RADIUS / 2,
            y: -Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(-45, 0.000001)
          value[:lon].should be_close(-45, 0.000001)
        end
      end

      context "when lat -45, lon -135" do
        it do
          value = Crgeo::Transfers::CartesianToSpherical.new(
            x: -Crgeo::RADIUS / 2,
            y: -Math.sqrt(2) * Crgeo::RADIUS / 2,
            z: -Crgeo::RADIUS / 2
          ).value

          value[:lat].should be_close(-45, 0.000001)
          value[:lon].should be_close(-135, 0.000001)
        end
      end
    end

    context "when invalid coordinates" do
      it do
        expect_raises(Crgeo::InvalidCoordinates) do
          Crgeo::Transfers::CartesianToSpherical.new(x: 100, y: 100, z: 100).value
        end
      end
    end
  end
end
