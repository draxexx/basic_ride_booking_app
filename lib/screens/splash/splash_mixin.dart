import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/helpers/log_helper.dart';
import '../book_ride/book_ride_screen.dart';
import 'splash_screen.dart';

mixin SplashMixin on State<SplashScreen> {
  void _redirectToBookRideScreen() {
    if (mounted) {
      Navigator.pushReplacement(context, BookRideScreen.route());
    }
  }

  void _loadData() {
    Timer(const Duration(seconds: 2), () {
      _redirectToBookRideScreen();
    });
  }

  Future<void> _initialize() async {
    try {
      _loadData();
    } catch (e, stack) {
      LogHelper.error('$e\n$stack');
    }
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }
}
