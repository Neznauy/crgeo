module Crgeo
  class Normalization
    getter lat1 : Float64
    getter lon1 : Float64
    getter lat2 : Float64
    getter lon2 : Float64
    getter lat  : Float64
    getter lon  : Float64

    def initialize(lat1 : Float64, lon1 : Float64, lat2 : Float64, lon2 : Float64, lat : Float64, lon : Float64)
      @lat1 = lat1
      @lon1 = lon1
      @lat2 = lat2
      @lon2 = lon2
      @lat  = lat
      @lon  = lon
    end

    def value : NamedTuple(lat: Float64, lon: Float64)
      validate_coordinates!

      # coefficients of plane equation through the center of the sphere and 2 points

      a = cartesian_1[:y] * cartesian_2[:z] - cartesian_2[:y] * cartesian_1[:z]
      b = cartesian_2[:x] * cartesian_1[:z] - cartesian_1[:x] * cartesian_2[:z]
      c = cartesian_1[:x] * cartesian_2[:y] - cartesian_2[:x] * cartesian_1[:y]

      # coefficient of parametric equation of normal to the plane through the point

      k = (-a * cartesian_n[:x] - b * cartesian_n[:y] - c * cartesian_n[:z]) / (a**2 + b**2 + c**2)

      # coordinates of normal's base

      xn = cartesian_n[:x] + a * k
      yn = cartesian_n[:y] + b * k
      zn = cartesian_n[:z] + c * k

      # coefficient of parametric equation of straight through center of the sphere and normal's base

      kn = Crgeo::RADIUS / Math.sqrt(xn**2 + yn**2 + zn**2)

      # normalized coordinates

      x = xn * kn
      y = yn * kn
      z = zn * kn

      Crgeo::Transfers::CartesianToSpherical.new(x: x, y: y, z: z).value
    end

    private def sphere_center_and_points_on_single_straight?
      lat1 == 0 && lat2 == 0 && (lon2 - lon1).abs == 180
    end

    private def polar_to_equator_plane?
      lat1 == 0 && lat2 == 0 && lat.abs == 90
    end

    private def cartesian_1 : NamedTuple(x: Float64, y: Float64, z: Float64)
      Crgeo::Transfers::SphericalToCartesian.new(lat: lat1, lon: lon1).value
    end

    private def cartesian_2 : NamedTuple(x: Float64, y: Float64, z: Float64)
      Crgeo::Transfers::SphericalToCartesian.new(lat: lat2, lon: lon2).value
    end

    private def cartesian_n : NamedTuple(x: Float64, y: Float64, z: Float64)
      Crgeo::Transfers::SphericalToCartesian.new(lat: lat, lon: lon).value
    end

    private def validate_coordinates!
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat, lon: lon)
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat1, lon: lon1)
      raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: lat2, lon: lon2)
      raise Crgeo::InvalidCoordinates.new if sphere_center_and_points_on_single_straight?
      raise Crgeo::InvalidCoordinates.new if polar_to_equator_plane?
    end
  end
end
