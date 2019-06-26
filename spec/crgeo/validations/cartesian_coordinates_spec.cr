require "../../spec_helper"

describe Crgeo::Validations::CartesianCoordinates do
  describe "#valid?" do
    context "when valid" do
      context "when equal" do
        it do
          klass = Crgeo::Validations::CartesianCoordinates.new(x: 6371000, y: 0, z: 0, precision: 0.0)
          klass.valid?.should be_true
        end
      end

      context "when more, but in tolerance" do
        it do
          klass = Crgeo::Validations::CartesianCoordinates.new(x: 6371000.001, y: 0, z: 0, precision: 0.1)
          klass.valid?.should be_true
        end
      end

      context "when less, but in tolerance" do
        it do
          klass = Crgeo::Validations::CartesianCoordinates.new(x: 6370999.999, y: 0, z: 0, precision: 0.1)
          klass.valid?.should be_true
        end
      end
    end

    context "when invalid" do
      context "when totally invalid" do
        it do
          klass = Crgeo::Validations::CartesianCoordinates.new(x: 55234, y: 523, z: 76457, precision: 0.001)
          klass.valid?.should be_false
        end
      end

      context "when more than tolerance" do
        it do
          klass = Crgeo::Validations::CartesianCoordinates.new(x: 6371000.01, y: 0, z: 0, precision: 0.001)
          klass.valid?.should be_false
        end
      end

      context "when less than tolerance" do
        it do
          klass = Crgeo::Validations::CartesianCoordinates.new(x: 6370999.99, y: 0, z: 0, precision: 0.001)
          klass.valid?.should be_false
        end
      end
    end
  end
end
