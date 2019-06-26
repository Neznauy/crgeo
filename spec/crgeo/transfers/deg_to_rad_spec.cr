require "../../spec_helper"

describe Crgeo::Transfers::DegToRad do
  describe "#value" do
    context "when 0 degrees" do
      it do
        klass = Crgeo::Transfers::DegToRad.new(0)
        klass.value.should eq 0
      end
    end

    context "when 45 degrees" do
      it do
        klass = Crgeo::Transfers::DegToRad.new(45)
        klass.value.should eq Math::PI / 4
      end
    end

    context "when 60 degrees" do
      it do
        klass = Crgeo::Transfers::DegToRad.new(60)
        klass.value.should eq Math::PI / 3
      end
    end

    context "when 90 degrees" do
      it do
        klass = Crgeo::Transfers::DegToRad.new(90)
        klass.value.should eq Math::PI / 2
      end
    end

    context "when 180 degrees" do
      it do
        klass = Crgeo::Transfers::DegToRad.new(180)
        klass.value.should eq Math::PI
      end
    end
  end
end
