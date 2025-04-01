import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/book_ride_provider.dart';

class SelectDestination extends StatelessWidget {
  const SelectDestination({super.key});

  @override
  Widget build(BuildContext context) {
    final bookRide = context.watch<BookRideProvider>().bookRide;

    return SelectLocation(
      text:
          bookRide.destination?.address ??
          "Please select a destination on the map",
    );
  }
}
