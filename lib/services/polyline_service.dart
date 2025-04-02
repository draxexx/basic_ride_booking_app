import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../utils/helpers/log_helper.dart';

/// A service to fetch and decode polyline data from Google Maps Directions API.
final class PolylineService {
  /// Fetches the route points between two locations using the Google Maps Directions API.
  Future<List<LatLng>> getRoutePoints({
    required LatLng origin,
    required LatLng destination,
    required String apiKey,
  }) async {
    try {
      final url =
          'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$apiKey';

      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      final points = data['routes'][0]['overview_polyline']['points'];
      return _decodePolyline(points);
    } catch (e) {
      LogHelper.error('Error fetching route points: $e');
      return [];
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    try {
      List<LatLng> points = [];
      int index = 0, len = encoded.length;
      int lat = 0, lng = 0;

      while (index < len) {
        int b, shift = 0, result = 0;
        do {
          b = encoded.codeUnitAt(index++) - 63;
          result |= (b & 0x1f) << shift;
          shift += 5;
        } while (b >= 0x20);
        int dlat = ((result & 1) != 0) ? ~(result >> 1) : (result >> 1);
        lat += dlat;

        shift = 0;
        result = 0;
        do {
          b = encoded.codeUnitAt(index++) - 63;
          result |= (b & 0x1f) << shift;
          shift += 5;
        } while (b >= 0x20);
        int dlng = ((result & 1) != 0) ? ~(result >> 1) : (result >> 1);
        lng += dlng;

        points.add(LatLng(lat / 1E5, lng / 1E5));
      }
      return points;
    } catch (e) {
      LogHelper.error('Error decoding polyline: $e');
      return [];
    }
  }
}
