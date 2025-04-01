import 'package:basic_ride_booking_app/screens/book_ride/widgets/book_confirm.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/book_ride_steps_mixin.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_destination.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_passengers_count.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_pickup.dart';
import 'package:basic_ride_booking_app/screens/book_ride/widgets/select_ride_date.dart';
import 'package:basic_ride_booking_app/widgets/circular_icon_button.dart';
import 'package:basic_ride_booking_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/book_ride_provider.dart';

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
      const SelectPassengersCount(),
      const SelectRideDate(),
      const BookConfirm(),
    ];

    final currentStep = context.watch<BookRideProvider>().currentStep;

    return Column(
      children: [
        buildPageIndicator(
          itemCount: bookRideSteps.length,
          currentIndex: currentStep,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: bookRideSteps,
            ),
          ),
        ),
        Row(
          children: [
            CircularIconButton(onPressed: previous),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                onPressed: () => next(bookRideSteps.length),
                text: "Continue",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
