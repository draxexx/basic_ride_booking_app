import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/geolocator_service.dart';
import '../utils/constants/enums/location_permission_status.dart';
import '../utils/helpers/log_helper.dart';

class GeolocatorProvider with ChangeNotifier {
  final GeolocatorService geolocatorService;

  LocationPermissionStatus _permissionStatus = LocationPermissionStatus.initial;
  LocationPermissionStatus get permissionStatus => _permissionStatus;

  GeolocatorProvider({required this.geolocatorService});

  bool _isMapInitialized = false;
  bool get isMapInitialized => _isMapInitialized;

  void setMapInitialized(bool value) {
    _isMapInitialized = value;
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
}
