require "../../spec_helper"

describe Crgeo::Transfers::GradToRad do
  describe "#value" do
    context "when 0 grads" do
      it do
        klass = Crgeo::Transfers::GradToRad.new(0)
        klass.value.should eq 0
      end
    end

    context "when 45 grads" do
      it do
        klass = Crgeo::Transfers::GradToRad.new(45)
        klass.value.should eq Math::PI / 4
      end
    end

    context "when 60 grads" do
      it do
        klass = Crgeo::Transfers::GradToRad.new(60)
        klass.value.should eq Math::PI / 3
      end
    end

    context "when 90 grads" do
      it do
        klass = Crgeo::Transfers::GradToRad.new(90)
        klass.value.should eq Math::PI / 2
      end
    end

    context "when 180 grads" do
      it do
        klass = Crgeo::Transfers::GradToRad.new(180)
        klass.value.should eq Math::PI
      end
    end
  end
end
