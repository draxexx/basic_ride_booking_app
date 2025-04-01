import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../helpers/log_helper.dart';
import 'service_locator.dart';
import 'system_config.dart';

final getIt = GetIt.instance;

final class AppInitializer {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    try {
      setupLocator();
      setSystemConfigurations();
      await dotenv.load(fileName: ".env");
    } catch (e) {
      LogHelper.error("Initialization failed: $e");
    }

    // Log Flutter Errors
    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      LogHelper.error(details.exceptionAsString());
      FlutterError.presentError(details);
    };
  }
}
