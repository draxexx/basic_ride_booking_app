import 'package:basic_ride_booking_app/widgets/date_picker_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/book_ride_provider.dart';

class SelectRideDate extends StatelessWidget {
  const SelectRideDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Please select a date and time for your ride",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            DatePickerTextField(
              onDateSelected:
                  (value) => context.read<BookRideProvider>().updateDate(value),
            ),
          ],
        ),
      ),
    );
  }
}
