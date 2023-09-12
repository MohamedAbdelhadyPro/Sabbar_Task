part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent extends Equatable {}

class InitSplashEvent extends SplashEvent {
  @override
  List<Object?> get props => [];
}
