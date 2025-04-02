import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/helpers/log_helper.dart';

/// A service to convert latitude and longitude to a human-readable address.
final class GecodingService {
  /// Converts a given address to its corresponding latitude and longitude.
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
