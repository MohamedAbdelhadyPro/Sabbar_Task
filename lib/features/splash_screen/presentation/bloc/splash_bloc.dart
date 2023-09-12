import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handover/core/di/di.dart';
import 'package:location/location.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/navigation_service.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<InitSplashEvent>(_splashInit);
  }

  Future<FutureOr<void>> _splashInit(
      InitSplashEvent event, Emitter<SplashState> emit) async {
    try {
      await getMyLocation();
    } catch (e) {}

    Future.delayed(Duration(seconds: 2)).then((value) {
      di<NavigationService>().pushNamedAndRemoveUntil(AppRoutes.homeScreenRoute,
          arguments: state.locationData == null
              ? null
              : LatLng(state.locationData!.latitude!,
                  state.locationData!.longitude!));
    });
  }

  getMyLocation() async {
    state.serviceEnabled = await state.location.serviceEnabled();
    if (!state.serviceEnabled) {
      state.serviceEnabled = await state.location.requestService();
      if (!state.serviceEnabled) {
        return;
      }
    }

    state.permissionGranted = await state.location.hasPermission();
    if (state.permissionGranted == PermissionStatus.denied) {
      state.permissionGranted = await state.location.requestPermission();
      if (state.permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    state.locationData = await state.location.getLocation();
  }
}
