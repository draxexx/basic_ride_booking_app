import 'package:basic_ride_booking_app/widgets/confirm_dialog.dart';
import 'package:flutter/material.dart';

import '../../../providers/book_ride_provider.dart';
import '../../../utils/setup/app_initializer.dart';
import '../../../widgets/success_dialog.dart';
import 'book_ride_steps.dart';

mixin BookRideStepsMixin on State<BookRideSteps> {
  final PageController pageController = PageController();
  final bookRideProvider = getIt<BookRideProvider>();

  void confirm() {
    showConfirmDialog(
      context: context,
      onSubmit:
          () => showSuccessDialog(
            context: context,
            onSubmit: () {},
            message: "Ride booked successfully!",
          ),
      message: "Are you sure you want to book this ride?",
    );
  }

  void next(int bookRideStepsLength) {
    if (bookRideProvider.currentStep < bookRideStepsLength - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previous() {
    if (bookRideProvider.currentStep > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget buildPageIndicator({
    required int itemCount,
    required int currentIndex,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        bool isActive = index == currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 12 : 8,
          height: isActive ? 12 : 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final newIndex = pageController.page?.round() ?? 0;

      if (newIndex != bookRideProvider.currentStep) {
        bookRideProvider.setCurrentStep(newIndex);
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
