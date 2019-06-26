module Crgeo
  class Center
    getter points : Array(NamedTuple(lat: Float64, lon: Float64))

    def initialize(points : Array(NamedTuple(lat: Float64, lon: Float64)))
      @points = points
    end

    def value
      validate_coordinates!

      points_as_cartesian = points.map { |p| point_as_rads(p) }.map { |p| point_as_cartesian(p) }

      x, y, z = 0, 0, 0
      points_as_cartesian.each do |p|
        x += p[:x]
        y += p[:y]
        z += p[:z]
      end

      c = points_as_cartesian.count { true }
      average = {x: x / c, y: y / c, z: z / c}

      k = Crgeo.radius / Math.sqrt(average[:x]**2 + average[:y]**2 + average[:z]**2)
      center = Crgeo::Transfers.cartesian_to_spherical(x: k * average[:x], y: k * average[:y], z: k * average[:z])

      {
        lat: Crgeo::Transfers.rad_to_deg(center[:lat]),
        lon: Crgeo::Transfers.rad_to_deg(center[:lon])
      }
    end

    private def point_as_rads(point : NamedTuple(lat: Float64, lon: Float64)) : NamedTuple(lat: Float64, lon: Float64)
      {
        lat: Crgeo::Transfers.deg_to_rad(point[:lat]),
        lon: Crgeo::Transfers.deg_to_rad(point[:lon])
      }
    end

    private def point_as_cartesian(point : NamedTuple(lat: Float64, lon: Float64)) : NamedTuple(x: Float64, y: Float64, z: Float64)
      Crgeo::Transfers.spherical_to_cartesian(lat: point[:lat], lon: point[:lon])
    end

    private def validate_coordinates!
      points.each do |p|
        raise Crgeo::InvalidCoordinates.new unless Crgeo::Validations.spherical_coordinates(lat: p[:lat], lon: p[:lon])
      end
    end
  end
end
