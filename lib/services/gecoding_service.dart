import 'package:basic_ride_booking_app/utils/helpers/log_helper.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final class GecodingService {
  Future<String?> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return "${place.street}, ${place.locality}, ${place.country}";
      }
    } catch (e) {
      LogHelper.error("Error getting address from lat/lng: $e");
    }

    return null;
  }
}
