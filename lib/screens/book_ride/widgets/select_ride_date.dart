import 'package:basic_ride_booking_app/widgets/date_picker_text_field.dart';
import 'package:flutter/material.dart';

class SelectRideDate extends StatelessWidget {
  const SelectRideDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Please select a date and time for your ride",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 16),
        DatePickerTextField(onDateSelected: (value) => print(value)),
      ],
    );
  }
}
