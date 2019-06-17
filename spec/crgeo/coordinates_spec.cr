require "../spec_helper"

describe Crgeo::Coordinates do
  describe "#grad_to_rad" do
    context "when 0 grads" do
      it { Crgeo::Coordinates.grad_to_rad(0).should eq 0 }
    end

    context "when 45 grads" do
      it { Crgeo::Coordinates.grad_to_rad(45).should eq Math::PI / 4 }
    end

    context "when 60 grads" do
      it { Crgeo::Coordinates.grad_to_rad(60).should eq Math::PI / 3 }
    end

    context "when 90 grads" do
      it { Crgeo::Coordinates.grad_to_rad(90).should eq Math::PI / 2 }
    end

    context "when 180 grads" do
      it { Crgeo::Coordinates.grad_to_rad(180).should eq Math::PI }
    end
  end
end
