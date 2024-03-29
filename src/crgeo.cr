# TODO: Write documentation for `Crgeo`
require "./crgeo/**"

module Crgeo
  @@radius : Float64 | Nil

  VERSION = "0.1.0"

  # Earth radius in meters by https://en.wikipedia.org/wiki/Earth
  EARTH_RADIUS = 6_371_000.0

  def self.radius
    @@radius || EARTH_RADIUS
  end

  def self.radius=(radius)
    @@radius = radius
  end

  def self.distance_between(lat1 : Float64, lon1 : Float64, lat2 : Float64, lon2 : Float64) : Float64
    Crgeo::Distance.new(lat1: lat1, lon1: lon1, lat2: lat2, lon2: lon2).value
  end

  def self.normalize(lat1 : Float64, lon1 : Float64, lat2 : Float64, lon2 : Float64, lat : Float64, lon : Float64) : NamedTuple(lat: Float64, lon: Float64)
    Crgeo::Normalization.new(lat1: lat1, lon1: lon1, lat2: lat2, lon2: lon2, lat: lat, lon: lon).value
  end

  def self.angle(lat1 : Float64, lon1 : Float64, lat2 : Float64, lon2 : Float64, lat : Float64, lon : Float64) : Float64
    Crgeo::Angle.new(lat1: lat1, lon1: lon1, lat2: lat2, lon2: lon2, lat: lat, lon: lon).value
  end

  def self.bearing_between(lat1 : Float64, lon1 : Float64, lat2 : Float64, lon2 : Float64) : Float64
    Crgeo::Bearing.new(lat1: lat1, lon1: lon1, lat2: lat2, lon2: lon2).value
  end

  def self.lat_distance : Float64
    2 * Math::PI * radius / 360
  end

  def self.lon_distance(lat : Float64) : Float64
    Math.cos(Crgeo::Transfers.deg_to_rad(lat)) * self.lat_distance
  end

  def self.center_of(points : Array(NamedTuple(lat: Float64, lon: Float64))) : NamedTuple(lat: Float64, lon: Float64)
    Crgeo::Center.new(points).value
  end

  class InvalidCoordinates < Exception
  end
end
