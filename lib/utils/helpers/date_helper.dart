import 'package:basic_ride_booking_app/utils/helpers/log_helper.dart';
import 'package:flutter/material.dart';

final class DateHelper {
  /// A utiliy function to select a date using a date picker dialog.
  Future<DateTime?> selectDate({
    required BuildContext context,
    DateTime? initialDate,
  }) async {
    try {
      final dateTime = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        initialDate: initialDate ?? DateTime.now(),
      );

      return dateTime;
    } catch (e) {
      LogHelper.error('Error selecting date: $e');
      return null;
    }
  }

  /// A utility function to select a time using a time picker dialog.
  Future<TimeOfDay?> selectTime({
    required BuildContext context,
    TimeOfDay? initialTime,
  }) async {
    final time = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );

    return time;
  }
}
