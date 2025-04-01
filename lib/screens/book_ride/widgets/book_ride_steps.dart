import 'package:basic_ride_booking_app/screens/book_ride/widgets/book_confirm.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/book_ride_steps_mixin.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_destination.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_passengers_count.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_pickup.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_ride_date.dart';
import 'package:basic_ride_booking_app/widgets/circular_icon_button.dart';
import 'package:basic_ride_booking_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookRideSteps extends StatefulWidget {
  const BookRideSteps({super.key});

  @override
  State<BookRideSteps> createState() => _BookRideStepsState();
}

class _BookRideStepsState extends State<BookRideSteps> with BookRideStepsMixin {
  @override
  Widget build(BuildContext context) {
    final List<Widget> bookRideSteps = [
      const SelectPickup(),
      const SelectDestination(),
      SelectPassengersCount(),
      const SelectRideDate(),
      const BookConfirm(),
    ];

    return Column(
      children: [
        buildPageIndicator(
          itemCount: bookRideSteps.length,
          currentIndex: currentIndex,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: PageView(
              controller: pageController,
              children: bookRideSteps,
            ),
          ),
        ),
        Row(
          children: [
            CircularIconButton(onPressed: () {}),
            const SizedBox(width: 16),
            Expanded(child: CustomButton(onPressed: () {}, text: "Continue")),
          ],
        ),
      ],
    );
  }
}
