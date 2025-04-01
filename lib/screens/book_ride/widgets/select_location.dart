import 'package:flutter/material.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on, size: 64, color: Colors.red),
        const SizedBox(height: 16),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
