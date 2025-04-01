import 'package:basic_ride_booking_app/utils/extensions/datetime_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/book_ride_provider.dart';

class BookConfirm extends StatelessWidget {
  const BookConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    final bookRide = context.watch<BookRideProvider>().bookRide;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Summary",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            BookSummaryItem(
              title: "Pickup Location",
              text: "${bookRide.pickup?.latitude}",
            ),
            const SizedBox(height: 4),
            BookSummaryItem(
              title: "Destination",
              text: "${bookRide.destination?.latitude}",
            ),
            const SizedBox(height: 4),
            BookSummaryItem(
              title: "Passengers",
              text: "${bookRide.passengers}",
            ),
            const SizedBox(height: 4),
            BookSummaryItem(
              title: "Date",
              text: bookRide.date?.formatDate() ?? "",
            ),
          ],
        ),
      ),
    );
  }
}

class BookSummaryItem extends StatelessWidget {
  const BookSummaryItem({super.key, required this.title, required this.text});

  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
