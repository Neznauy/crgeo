require "../spec_helper"

describe Crgeo::Transfers do
  describe "#deg_to_rad" do
    context "when 0 degrees" do
      it { Crgeo::Transfers.deg_to_rad(0).should eq 0 }
    end

    context "when 45 degrees" do
      it { Crgeo::Transfers.deg_to_rad(45).should eq Math::PI / 4 }
    end

    context "when 60 degrees" do
      it { Crgeo::Transfers.deg_to_rad(60).should eq Math::PI / 3 }
    end

    context "when 90 degrees" do
      it { Crgeo::Transfers.deg_to_rad(90).should eq Math::PI / 2 }
    end

    context "when 180 degrees" do
      it { Crgeo::Transfers.deg_to_rad(180).should eq Math::PI }
    end
  end

  describe "#rad_to_deg" do
    context "when 0 rads" do
      it { Crgeo::Transfers.rad_to_deg(0).should be_close(0, 0.000001) }
    end

    context "when 45 rads" do
      it { Crgeo::Transfers.rad_to_deg(Math::PI / 4).should be_close(45, 0.000001) }
    end

    context "when 60 rads" do
      it { Crgeo::Transfers.rad_to_deg(Math::PI / 3).should be_close(60, 0.000001) }
    end

    context "when 90 rads" do
      it { Crgeo::Transfers.rad_to_deg(Math::PI / 2).should be_close(90, 0.000001) }
    end

    context "when 180 rads" do
      it { Crgeo::Transfers.rad_to_deg(Math::PI).should be_close(180, 0.000001) }
    end
  end
end
