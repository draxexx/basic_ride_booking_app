import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SelectPassengersCount extends StatelessWidget {
  SelectPassengersCount({super.key});

  final ValueNotifier<int> _passengerCount = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Please select the number of passengers",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<int>(
          valueListenable: _passengerCount,
          builder:
              (context, value, child) => NumberPicker(
                value: value,
                minValue: 0,
                maxValue: 100,
                onChanged: (value) => _passengerCount.value = value,
              ),
        ),
      ],
    );
  }
}
