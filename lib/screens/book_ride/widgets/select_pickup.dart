import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/book_ride_provider.dart';
import 'select_location.dart';

class SelectPickup extends StatelessWidget {
  const SelectPickup({super.key});

  @override
  Widget build(BuildContext context) {
    final bookRide = context.watch<BookRideProvider>().bookRide;

    return SelectLocation(
      text:
          bookRide.pickup?.address ??
          "Please select a pickup location on the map",
    );
  }
}
