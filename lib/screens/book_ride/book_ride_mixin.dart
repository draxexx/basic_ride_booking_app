import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../providers/geolocator_provider.dart';
import '../../services/geolocator_service.dart';
import '../../utils/helpers/log_helper.dart';
import '../../utils/helpers/permission_helper.dart';
import '../../utils/setup/app_initializer.dart';
import 'book_ride_screen.dart';

mixin BookRideMixin on State<BookRideScreen> {
  final _geolocatorProvider = getIt<GeolocatorProvider>();
  final _geolocatorService = getIt<GeolocatorService>();

  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  final double _cameraZoom = 14;

  late CameraPosition cameraPosition;

  Future<bool> _hasPermission(BuildContext context) async {
    await _geolocatorProvider.checkAndRequestPermission();

    if (context.mounted) {
      return await PermissionHelper.checkAndRequestPermission(
        context: context,
        permissionStatus: _geolocatorProvider.permissionStatus,
        geolocatorService: _geolocatorService,
      );
    }

    return false;
  }

  void _initMap() async {
    try {
      final hasPermission = await _hasPermission(context);

      if (!hasPermission) {
        return;
      }

      final position = await _geolocatorProvider.getCurrentPosition();

      cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: _cameraZoom,
      );

      _geolocatorProvider.setMapInitialized(true);
    } catch (e) {
      LogHelper.error("Error in _initMap: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _initMap();
  }
}
