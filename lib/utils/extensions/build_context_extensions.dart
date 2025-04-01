import 'package:flutter/material.dart';

import '../helpers/log_helper.dart';

extension DatePickerUtils on BuildContext {
  Future<DateTime?> showDatePickerDialog(DateTime? initialDate) async {
    return await showDatePicker(
      context: this,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
  }

  Future<TimeOfDay?> showTimePickerDialog(TimeOfDay? initialTime) async {
    return await showTimePicker(
      context: this,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
  }

  Future<DateTime?> showDateAndTimePickerDialog(
    DateTime? initialDateTime,
  ) async {
    try {
      final selectedDate = await showDatePickerDialog(initialDateTime);

      if (selectedDate == null) return null;

      final selectedTime = await showTimePickerDialog(
        initialDateTime != null
            ? TimeOfDay.fromDateTime(initialDateTime)
            : null,
      );

      if (selectedTime == null) return null;

      final combinedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      return combinedDateTime;
    } catch (e) {
      LogHelper.error('Error selecting date and time: $e');
      return null;
    }
  }
}
