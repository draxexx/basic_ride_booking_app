import 'package:basic_ride_booking_app/screens/book_ride/widgets/book_ride_steps.dart';
import 'package:flutter/material.dart';

mixin BookRideStepsMixin on State<BookRideSteps> {
  final PageController pageController = PageController();

  int currentIndex = 0;

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
      if (newIndex != currentIndex) {
        setState(() {
          currentIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
