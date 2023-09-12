import '../../features/home_screen/bloc/home_bloc.dart';
import '../../features/splash_screen/presentation/bloc/splash_bloc.dart';
import 'di.dart';

initializeBlocs() {
  di.registerFactory(() => SplashBloc());
  di.registerFactory(() => HomeBloc());
}
