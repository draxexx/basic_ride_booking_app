import 'package:flutter/material.dart';

import '../../services/geolocator_service.dart';
import '../../widgets/confirm_dialog.dart';
import '../constants/enums/location_permission_status.dart';
import 'log_helper.dart';

/// The helper class for checking and requesting location permission
final class PermissionHelper {
  static Future<bool> checkAndRequestPermission({
    required BuildContext context,
    required LocationPermissionStatus permissionStatus,
    required GeolocatorService geolocatorService,
  }) async {
    try {
      if (permissionStatus == LocationPermissionStatus.serviceDisabled) {
        _showConfirmDialog(
          context,
          geolocatorService,
          "Please enable location service to continue.",
        );
        return false;
      } else if (permissionStatus == LocationPermissionStatus.denied) {
        _showConfirmDialog(
          context,
          geolocatorService,
          "Please enable location permission to continue.",
        );
        return false;
      } else if (permissionStatus == LocationPermissionStatus.deniedForever) {
        _showConfirmDialog(
          context,
          geolocatorService,
          "Please enable location permission to continue.",
        );
        return false;
      }
      return true;
    } catch (e) {
      LogHelper.error("Error in checkAndRequestPermission: $e");
      return false;
    }
  }

  static void _showConfirmDialog(
    BuildContext context,
    GeolocatorService geolocatorService,
    String message,
  ) {
    showConfirmDialog(
      context: context,
      onSubmit: () => geolocatorService.openSettings(),
      message: message,
    );
  }
}
