require "../../spec_helper"

describe Crgeo::Transfers::RadToGrad do
  describe "#value" do
    context "when 0 rads" do
      it do
        klass = Crgeo::Transfers::RadToGrad.new(0)
        klass.value.should be_close(0, 0.000001)
      end
    end

    context "when Pi/4 rads" do
      it do
        klass = Crgeo::Transfers::RadToGrad.new(Math::PI / 4)
        klass.value.should be_close(45, 0.000001)
      end
    end

    context "when Pi/3 rads" do
      it do
        klass = Crgeo::Transfers::RadToGrad.new(Math::PI / 3)
        klass.value.should be_close(60, 0.000001)
      end
    end

    context "when Pi/2 rads" do
      it do
        klass = Crgeo::Transfers::RadToGrad.new(Math::PI / 2)
        klass.value.should be_close(90, 0.000001)
      end
    end

    context "when Pi rads" do
      it do
        klass = Crgeo::Transfers::RadToGrad.new(Math::PI)
        klass.value.should be_close(180, 0.000001)
      end
    end
  end
end
