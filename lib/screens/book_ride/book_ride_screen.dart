import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/geolocator_provider.dart';
import 'book_ride_mixin.dart';

class BookRideScreen extends StatefulWidget {
  const BookRideScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => const BookRideScreen());
  }

  @override
  State<BookRideScreen> createState() => _BookRideScreenState();
}

class _BookRideScreenState extends State<BookRideScreen> with BookRideMixin {
  @override
  Widget build(BuildContext context) {
    bool isMapInitialized =
        context.watch<GeolocatorProvider>().isMapInitialized;

    return Scaffold(
      body:
          isMapInitialized
              ? GoogleMap(
                initialCameraPosition: cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  googleMapController.complete(controller);
                },
              )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
