import 'package:basic_ride_booking_app/screens/book_ride/widgets/book_ride_steps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/geolocator_provider.dart';
import '../../widgets/custom_draggable_scrollable_sheet.dart';
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
    final isMapInitialized =
        context.watch<GeolocatorProvider>().isMapInitialized;

    final markers = context.watch<GeolocatorProvider>().markers;
    final polylines = context.watch<GeolocatorProvider>().polylines;

    if (!isMapInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              if (!googleMapController.isCompleted) {
                googleMapController.complete(controller);
              }
            },
            onTap: onMapTapped,
            markers: markers,
            polylines: polylines,
          ),
          const CustomDraggableScrollableSheet(child: BookRideSteps()),
        ],
      ),
    );
  }
}
