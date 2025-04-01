import 'package:flutter/material.dart';

import '../models/book_ride.dart';
import '../models/location.dart';

class BookRideProvider with ChangeNotifier {
  BookRide _bookRide = const BookRide();
  BookRide get bookRide => _bookRide;

  int _currentStep = 0;
  int get currentStep => _currentStep;

  void setCurrentStep(int newStep) {
    _currentStep = newStep;
    notifyListeners();
  }

  void updateBookRide(BookRide newBookRide) {
    _bookRide = newBookRide;
    notifyListeners();
  }

  void updatePickup(Location pickup) {
    _bookRide = _bookRide.copyWith(pickup: pickup);
    notifyListeners();
  }

  void updateDestination(Location destination) {
    _bookRide = _bookRide.copyWith(destination: destination);
    notifyListeners();
  }

  void updatePassengers(int passengers) {
    _bookRide = _bookRide.copyWith(passengers: passengers);
    notifyListeners();
  }

  void updateDate(DateTime date) {
    _bookRide = _bookRide.copyWith(date: date);
    notifyListeners();
  }
}
