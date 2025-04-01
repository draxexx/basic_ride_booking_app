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
    final bookRide = context.watch<BookRideProvider>().bookRide;

    final bool isLastStep = currentStep == bookRideSteps.length - 1;

    final bool isButtonDisabled =
        currentStep == 0 && bookRide.pickup == null ||
        currentStep == 1 && bookRide.destination == null ||
        currentStep == 3 && bookRide.date == null;

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
            if (currentStep != 0) CircularIconButton(onPressed: previous),
            if (currentStep != 0) const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                onPressed:
                    isLastStep ? confirm : () => next(bookRideSteps.length),
                text: isLastStep ? "Confirm" : "Continue",
                isDisabled: isButtonDisabled,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
