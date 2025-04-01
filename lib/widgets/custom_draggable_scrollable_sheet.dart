import 'package:flutter/material.dart';

class CustomDraggableScrollableSheet extends StatelessWidget {
  const CustomDraggableScrollableSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: screenHeight * .4,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
        ),
        child: child,
      ),
    );
  }
}
