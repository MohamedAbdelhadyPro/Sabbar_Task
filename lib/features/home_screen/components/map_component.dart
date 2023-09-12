import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/home_bloc.dart';

class MapComponent extends StatelessWidget {
  const MapComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return GoogleMap(
        onMapCreated: (GoogleMapController googleMapController) {
          state.mapController = googleMapController;
        },
        mapType: MapType.normal,
        markers: state.markers ?? <Marker>{},
        polylines: state.polyline ?? <Polyline>{},
        initialCameraPosition: state.initLocation!,
      );
    });
  }
}
