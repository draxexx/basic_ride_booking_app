import 'dart:async';

import 'package:basic_ride_booking_app/providers/book_ride_provider.dart';
import 'package:basic_ride_booking_app/utils/constants/enums/location_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/location.dart';
import '../../providers/geolocator_provider.dart';
import '../../services/geolocator_service.dart';
import '../../utils/helpers/log_helper.dart';
import '../../utils/helpers/permission_helper.dart';
import '../../utils/setup/app_initializer.dart';
import 'book_ride_screen.dart';

mixin BookRideMixin on State<BookRideScreen> {
  final _geolocatorProvider = getIt<GeolocatorProvider>();
  final _bookRideProvider = getIt<BookRideProvider>();
  final _geolocatorService = getIt<GeolocatorService>();

  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  final double _cameraZoom = 14;

  late CameraPosition cameraPosition;

  bool get _isLocationSelection =>
      _bookRideProvider.currentStep == 0 || _bookRideProvider.currentStep == 1;

  String get _markerId =>
      _bookRideProvider.currentStep == 0
          ? LocationMarkers.pickup.id
          : _bookRideProvider.currentStep == 1
          ? LocationMarkers.destination.id
          : "";

  void onMapTapped(LatLng position) {
    if (!_isLocationSelection) return;

    final marker = Marker(markerId: MarkerId(_markerId), position: position);

    _geolocatorProvider.addOrUpdateMarker(marker);

    final location = Location(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    // if the current step is 0, update the pickup location
    // if the current step is 1, update the destination location
    if (_bookRideProvider.currentStep == 0) {
      _bookRideProvider.updatePickup(location);
    } else if (_bookRideProvider.currentStep == 1) {
      _bookRideProvider.updateDestination(location);
    }
  }

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
    Future.delayed(const Duration(milliseconds: 100), () async {
      try {
        if (mounted) {
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
        }
      } catch (e) {
        LogHelper.error("Error in _initMap: $e");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initMap();
  }

  @override
  void dispose() {
    super.dispose();
    _geolocatorProvider.dispose();
    _bookRideProvider.dispose();
  }
}
