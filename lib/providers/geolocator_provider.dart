import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/geolocator_service.dart';
import '../services/polyline_service.dart';
import '../utils/constants/enums/location_permission_status.dart';
import '../utils/helpers/log_helper.dart';

class GeolocatorProvider with ChangeNotifier {
  final GeolocatorService geolocatorService;
  final PolylineService polylineService;

  LocationPermissionStatus _permissionStatus = LocationPermissionStatus.initial;
  LocationPermissionStatus get permissionStatus => _permissionStatus;

  GeolocatorProvider({
    required this.geolocatorService,
    required this.polylineService,
  });

  bool _isMapInitialized = false;
  bool get isMapInitialized => _isMapInitialized;

  final Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  final Set<Polyline> _polylines = {};
  Set<Polyline> get polylines => _polylines;

  void setMapInitialized(bool value) {
    _isMapInitialized = value;
    notifyListeners();
  }

  void addOrUpdateMarker(Marker newMarker) {
    final id = newMarker.markerId;

    _markers.removeWhere((marker) => marker.markerId == id);

    _markers.add(newMarker);

    notifyListeners();
  }

  Future<void> checkAndRequestPermission() async {
    try {
      final serviceEnabled = await geolocatorService.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _permissionStatus = LocationPermissionStatus.serviceDisabled;
        notifyListeners();
        return;
      }

      LocationPermission permission = await geolocatorService.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await geolocatorService.requestPermission();
        if (permission == LocationPermission.denied) {
          _permissionStatus = LocationPermissionStatus.denied;
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _permissionStatus = LocationPermissionStatus.deniedForever;
        notifyListeners();
        return;
      }

      _permissionStatus = LocationPermissionStatus.grantedAlways;
      notifyListeners();
    } catch (e) {
      LogHelper.error("Error in checkAndRequestPermission: $e");
    }
  }

  Future<Position> getCurrentPosition() async {
    try {
      return await geolocatorService.getCurrentPosition();
    } catch (e) {
      LogHelper.error("Error in getCurrentPosition: $e");
      rethrow;
    }
  }

  Future<void> updatePolyLines(LatLng origin, LatLng destination) async {
    try {
      final apiKey = dotenv.env["GOOGLE_API_KEY"] ?? "";

      final routePoints = await polylineService.getRoutePoints(
        origin: origin,
        destination: destination,
        apiKey: apiKey,
      );

      final poly = Polyline(
        polylineId: const PolylineId("route"),
        points: routePoints,
        color: Colors.blue,
        width: 5,
      );

      _polylines.clear();
      _polylines.add(poly);
      notifyListeners();
    } catch (e) {
      LogHelper.error("Error in updatePolyLines: $e");
    }
  }
}
