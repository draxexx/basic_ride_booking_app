import 'package:basic_ride_booking_app/providers/book_ride_provider.dart';

import '../../providers/geolocator_provider.dart';
import '../../services/geolocator_service.dart';
import 'app_initializer.dart';

/// This function registers the services and providers in the service locator
void setupLocator() {
  _registerServices();
  _registerProviders();
}

void _registerServices() {
  getIt.registerLazySingleton<GeolocatorService>(() => GeolocatorService());
}

void _registerProviders() {
  getIt.registerLazySingleton<GeolocatorProvider>(
    () => GeolocatorProvider(geolocatorService: getIt<GeolocatorService>()),
  );
  getIt.registerLazySingleton<BookRideProvider>(() => BookRideProvider());
}
