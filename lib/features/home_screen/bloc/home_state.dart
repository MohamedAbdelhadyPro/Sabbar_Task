part of 'home_bloc.dart';

class HomeState {
  int? packageIndexStep = 1;
  DateTime? pickupTime;
  DateTime? delivertime;
  CameraPosition? initLocation;
  LatLng? pickupLocation;
  LatLng? destinationLocation;
  LatLng? carLocation;
  Set<Marker>? markers = <Marker>{};
  Set<Polyline>? polyline = <Polyline>{};
  GoogleMapController? mapController;

  HomeState(
      {this.packageIndexStep,
      this.pickupTime,
      this.delivertime,
      this.initLocation,
      this.pickupLocation,
      this.destinationLocation,
      this.carLocation,
      this.markers,
      this.polyline,
      this.mapController});

  HomeState copyWith({
    int? packageIndexStep,
    CameraPosition? initLocation,
    DateTime? pickupTime,
    DateTime? delivertime,
    LatLng? pickupLocation,
    LatLng? destinationLocation,
    LatLng? carLocation,
    Set<Marker>? markers,
    Set<Polyline>? polyline,
    GoogleMapController? mapController,
  }) {
    return HomeState(
      packageIndexStep: packageIndexStep ?? this.packageIndexStep,
      pickupTime: pickupTime ?? this.pickupTime,
      delivertime: delivertime ?? this.delivertime,
      initLocation: initLocation ?? this.initLocation,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
      carLocation: carLocation ?? this.carLocation,
      markers: markers ?? this.markers,
      polyline: polyline ?? this.polyline,
      mapController: mapController ?? this.mapController,
    );
  }
}
