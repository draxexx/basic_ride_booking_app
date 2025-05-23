import 'package:geolocator/geolocator.dart';

import '../utils/helpers/log_helper.dart';

/// A service that provides the current location of the device.
final class GeolocatorService {
  /// This method is used to get the distance between two positions
  /// [latitude1] is the latitude of the first position
  /// [longitude1] is the longitude of the first position
  /// [latitude2] is the latitude of the second position
  /// [longitude2] is the longitude of the second position
  double distanceBetween(
    double latitude1,
    double longitude1,
    double latitude2,
    double longitude2,
  ) {
    return Geolocator.distanceBetween(
      latitude1,
      longitude1,
      latitude2,
      longitude2,
    );
  }

  /// Check if the location service is enabled
  Future<bool> isLocationServiceEnabled() async {
    try {
      return await Geolocator.isLocationServiceEnabled();
    } catch (e) {
      LogHelper.error("Error checking location service: $e");
      rethrow;
    }
  }

  /// Check if the app has permission to access the location
  Future<LocationPermission> checkPermission() async {
    try {
      return await Geolocator.checkPermission();
    } catch (e) {
      LogHelper.error("Error checking permission: $e");
      rethrow;
    }
  }

  /// Request permission to access the location
  Future<LocationPermission> requestPermission() async {
    try {
      return await Geolocator.requestPermission();
    } catch (e) {
      LogHelper.error("Error requesting permission: $e");
      rethrow;
    }
  }

  /// Check if the app has permission to access the location
  Future<bool> hasPermission() async {
    try {
      final permission = await Geolocator.checkPermission();
      return permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse;
    } catch (e) {
      LogHelper.error("Error checking if has permission: $e");
      rethrow;
    }
  }

  /// Get the current position of the device
  Future<Position> getCurrentPosition() async {
    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      LogHelper.error("Error getting current position: $e");
      rethrow;
    }
  }

  /// Open the location settings in the device
  Future<void> openSettings() async {
    try {
      await Geolocator.openAppSettings();
    } catch (e) {
      LogHelper.error("Error opening location settings: $e");
    }
  }
}
