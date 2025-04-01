import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_location.dart';
import 'package:flutter/material.dart';

class SelectDestination extends StatelessWidget {
  const SelectDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectLocation(text: "Please select a destination on the map");
  }
}
