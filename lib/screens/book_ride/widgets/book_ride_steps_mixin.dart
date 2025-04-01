import 'package:flutter/material.dart';

import '../../../providers/book_ride_provider.dart';
import '../../../utils/setup/app_initializer.dart';
import 'book_ride_steps.dart';

mixin BookRideStepsMixin on State<BookRideSteps> {
  final PageController pageController = PageController();
  final bookRideProvider = getIt<BookRideProvider>();

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
