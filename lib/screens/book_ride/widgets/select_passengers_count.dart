import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../../../providers/book_ride_provider.dart';

class SelectPassengersCount extends StatelessWidget {
  const SelectPassengersCount({super.key});

  @override
  Widget build(BuildContext context) {
    final passengers = context.watch<BookRideProvider>().bookRide.passengers;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Please select the number of passengers",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            NumberPicker(
              value: passengers,
              minValue: 0,
              maxValue: 20,
              itemWidth: 50,
              selectedTextStyle: const TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
              axis: Axis.horizontal,
              onChanged:
                  (value) =>
                      context.read<BookRideProvider>().updatePassengers(value),
            ),
          ],
        ),
      ),
    );
  }
}
