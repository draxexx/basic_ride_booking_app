import 'dart:async';

import 'package:basic_ride_booking_app/screens/splash/splash_screen.dart';
import 'package:basic_ride_booking_app/utils/setup/app_state_wrapper.dart';
import 'package:flutter/material.dart';

import 'utils/helpers/log_helper.dart';
import 'utils/setup/app_initializer.dart';

void main() {
  runZonedGuarded(
    () async {
      // Initialize the dependencies
      await AppInitializer().init();

      runApp(const MyApp());
    },
    (Object error, StackTrace stackTrace) {
      LogHelper.error('$error\n$stackTrace');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      child: MaterialApp(
        title: 'Basic Ride Booking App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            primary: Colors.blueAccent,
            seedColor: Colors.blue,
          ),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
