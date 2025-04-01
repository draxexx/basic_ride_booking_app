import '../../providers/book_ride_provider.dart';
import '../../providers/geolocator_provider.dart';
import '../../services/gecoding_service.dart';
import '../../services/geolocator_service.dart';
import '../../services/polyline_service.dart';
import 'app_initializer.dart';

/// This function registers the services and providers in the service locator
void setupLocator() {
  _registerServices();
  _registerProviders();
}

void _registerServices() {
  getIt.registerLazySingleton<GeolocatorService>(() => GeolocatorService());
  getIt.registerLazySingleton<GecodingService>(() => GecodingService());
  getIt.registerLazySingleton<PolylineService>(() => PolylineService());
}

void _registerProviders() {
  getIt.registerLazySingleton<GeolocatorProvider>(
    () => GeolocatorProvider(
      geolocatorService: getIt<GeolocatorService>(),
      polylineService: getIt<PolylineService>(),
    ),
  );
  getIt.registerLazySingleton<BookRideProvider>(() => BookRideProvider());
}
