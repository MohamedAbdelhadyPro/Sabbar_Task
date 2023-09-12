import 'package:maps_toolkit/maps_toolkit.dart';

(double, double) getDestinationLocation(location) {
  LatLng dLocation = SphericalUtil.computeOffset(location, .01, 180);
  return (dLocation.latitude, dLocation.longitude);
}
