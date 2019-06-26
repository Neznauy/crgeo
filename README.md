# crgeo

**Simple library for geospatial computations. Also can be used for general spherical geometry.**

Configuration
-----------------------

Configure sphere radius. Earth radius (`Crgeo::EARTH_RADIUS`) is used by default

    Crgeo.radius = 3389500
    Crgeo.radius
     => 3389500 # meters

Usage
-----------------------

### Basic operations

Angle by 3 points. Vertex coordinates are `lan` and `lon`:

    Crgeo.angle(lat1: 90, lon1: 0, lat2: 0, lon2: 90, lat: 0, lon: 0)
     => 1.570796 # radians
     
Bearing from `1` to `2`:

    Crgeo.bearing_between(lat1: 0, lon1: -75, lat2: 0, lon2: -50)
     => 90 # degrees
  
Center of gravity of points array:

    Crgeo.center_of(points: [{lat: 0, lon: 0}, {lat: 0, lon: 1}])
     => {lat: 0, lon: 0.5} # degrees

Distance between two points:

    Crgeo.distance_between(lat1: 59.975031, lon1: 30.317386, lat2: 59.977222, lon2: 30.314992)
     => 277.661515 # meters
     
Length of 1 latitude degree

    Crgeo.lat_distance
     => 111194.926644 # meters
     
Length of 1 longitude degree with defined latitude

    Crgeo.lon_distance(lat: 0)
     => 111194.926644 # meters
     
Normalization. It is not strict operation. Returns coordinates of projection of point to the line with minimum distance between two other points:

    Crgeo.normalize(lat1: 59.92878, lon1: 30.412105, lat2: 59.929113, lon2: 30.411852, lat: 59.9287805, lon: 30.4121053)
     => {lat: 59.928780, lon: 30.412104} # degrees
     
### Transfers

Degrees to radians:

    Crgeo::Transfers.deg_to_rad(90)
     => 1.570796 # radians
     
Radians to degrees:

    Crgeo::Transfers.rad_to_deg(1.570796)
     => 90 # degrees
     
Cartesian coordinates to spherical:
    
    Crgeo::Transfers.cartesian_to_spherical(x: 0, y: 0, z: 6371000)
     => {lat: 0, lon: 0} # degrees
    
    # if coordinates can not be transfered to spherical coordinates of sphere with configurated radius and precision 0.01
    Crgeo::Transfers.cartesian_to_spherical(x: 0, y: 0, z: 3389500)
     => InvalidCoordinates
     
Spherical coordinates to cartesian:
    
    Crgeo::Transfers.spherical_to_cartesian(lat: 0, lon: 0)
     => {x: 0, y: 0, z: 6371000} # meters

### Validations

If cartesian coordinates can be transfered to spherical of sphere with configurated radius:

    Crgeo::Validations.cartesian_coordinates(x: 0, y: 0, z: 6371000, precision: 0.01)
     => true
     
    Crgeo::Validations.cartesian_coordinates(x: 0, y: 0, z: 6371000.1, precision: 0.01)
     => false
     
If spherical coordinates are `-180 <= longitude <= 180`, `-90 <= latitude <= 90`
    
    Crgeo::Validations.spherical_coordinates(lat: 90, lon: 0)
     => true

    Crgeo::Validations.spherical_coordinates(lat: 90, lon: 181)
     => false
     
Contributing
------------

Contributions are welcome via Github pull requests.

For all contributions, please respect the following guidelines:

* Each pull request should implement ONE feature or bugfix. 
* Do not commit changes to files that are irrelevant to your feature or bugfix (eg: `.gitignore`).
* Do not add dependencies on other gems.
* Be aware that the pull request review process is not immediate.
