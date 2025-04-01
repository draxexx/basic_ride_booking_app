import 'package:basic_ride_booking_app/providers/book_ride_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/geolocator_provider.dart';
import 'app_initializer.dart';

final class AppStateWrapper extends StatelessWidget {
  const AppStateWrapper({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GeolocatorProvider>(
          create: (context) => getIt<GeolocatorProvider>(),
        ),
        ChangeNotifierProvider<BookRideProvider>(
          create: (context) => getIt<BookRideProvider>(),
        ),
      ],
      child: child,
    );
  }
}
