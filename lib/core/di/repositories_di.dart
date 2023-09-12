import '../routes/navigation_service.dart';
import 'di.dart';

initializeRepositories() {
  // Navigation Service
  di.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );
}
