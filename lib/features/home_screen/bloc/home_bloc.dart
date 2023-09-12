import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handover/core/notification/local_notification.dart';
import 'package:handover/core/utils/assets.dart';
import 'package:handover/widgets/image_widget.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../../../core/utils/constant.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState(
            initLocation: CameraPosition(
                target: LatLng(24.7254554, 46.4928704), zoom: 10),
            pickupLocation: LatLng(24.7254554, 46.4928704),
            carLocation: LatLng(24.7254554, 46.4928704),
            destinationLocation: LatLng(24.7485149, 46.4630302),
            packageIndexStep: 1)) {
    on<HandleRouteEvent>(_handleRouteEvent);
    on<InitLocationEvent>(_initLocationEvent);
  }

  Future<FutureOr<void>> _initLocationEvent(
      InitLocationEvent event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(
        initLocation: CameraPosition(target: event.myLocation!, zoom: 13),
        pickupLocation: event.myLocation,
        carLocation: event.myLocation,
      ));
    } catch (e) {}
    try {
      emit(state.copyWith(
          destinationLocation: LatLng(
              event.myLocation!.latitude, event.myLocation!.longitude + .03)));
    } catch (e) {}
    add(HandleRouteEvent());
  }

  Future<FutureOr<void>> _handleRouteEvent(
      HandleRouteEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      markers: {
        Marker(
            markerId: const MarkerId("pickup"),
            position: state.pickupLocation!,
            icon: await customMarker(Colors.lightBlue).toBitmapDescriptor(
                logicalSize: const Size(160, 160),
                imageSize: const Size(160, 160))),
        Marker(
            markerId: const MarkerId("destination"),
            position: state.destinationLocation!,
            icon: await customMarker(Colors.cyan).toBitmapDescriptor(
                logicalSize: const Size(160, 160),
                imageSize: const Size(160, 160))),
        Marker(
            markerId: const MarkerId("carLocation"),
            position: state.carLocation!,
            icon: await customCarMarker(Colors.cyan).toBitmapDescriptor(
                logicalSize: const Size(160, 160),
                imageSize: const Size(160, 160))),
      },
    ));
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
            googleServicesKey,
            PointLatLng(state.pickupLocation!.latitude,
                state.pickupLocation!.longitude),
            PointLatLng(state.destinationLocation!.latitude,
                state.destinationLocation!.longitude));

    // draw polyline
    emit(state.copyWith(
      polyline: {
        Polyline(
            polylineId: PolylineId("routePolyline"),
            width: 3,
            color: Colors.black,
            points: polylineResult.points
                .map((e) => LatLng(e.latitude, e.longitude))
                .toList()),
      },
    ));

    // Make car move in way
    List<LatLng> li = polylineResult.points
        .map((e) => LatLng(e.latitude, e.longitude))
        .toList();
    for (int i = 0;
        i <
            polylineResult.points
                .map((e) => LatLng(e.latitude, e.longitude))
                .toList()
                .length;
        i++) {
      await Future.delayed(Duration(milliseconds: 300));
      if (i == 1) {
        emit(state.copyWith(packageIndexStep: 2, pickupTime: DateTime.now()));
      }
      if (i == (li.length - 30)) {
        LocalNotification.pushNotification(
            title: "Alert", body: "You will arrive soon");
        emit(state.copyWith(packageIndexStep: 3));
      }
      if (i == (li.length - 1)) {
        emit(state.copyWith(packageIndexStep: 4, delivertime: DateTime.now()));
        LocalNotification.pushNotification(
            title: "Alert", body: "Delivered Successful");
      }
      emit(state.copyWith(carLocation: li[i]));
      state.markers!.add(Marker(
          markerId: const MarkerId("carLocation"),
          position: state.carLocation!,
          icon: await customCarMarker(Colors.yellow).toBitmapDescriptor(
              logicalSize: const Size(160, 160),
              imageSize: const Size(160, 160))));
      emit(state.copyWith(markers: state.markers));
      if (state.mapController != null) {
        state.mapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: li[i], zoom: 15)));
      }
    }
  }

  Widget customMarker(Color color) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(100)),
        ),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: color.withOpacity(.3),
              borderRadius: BorderRadius.circular(100)),
        ),
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
              color: color.withOpacity(.3),
              borderRadius: BorderRadius.circular(100)),
        ),
      ],
    );
  }

  Widget customCarMarker(Color color) {
    return ImageWidget(AppAssets.carMarker, height: 120, width: 120);
  }
}
