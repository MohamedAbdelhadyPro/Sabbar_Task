part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class HandleRouteEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class InitLocationEvent extends HomeEvent {
  LatLng? myLocation;

  InitLocationEvent({required this.myLocation});

  @override
  List<Object?> get props => [];

  InitLocationEvent copyWith({
    LatLng? myLocation,
  }) {
    return InitLocationEvent(
      myLocation: myLocation ?? this.myLocation,
    );
  }
}
