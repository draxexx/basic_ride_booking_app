import 'package:basic_ride_booking_app/utils/extensions/build_context_extensions.dart';
import 'package:basic_ride_booking_app/utils/extensions/datetime_extensions.dart';
import 'package:flutter/material.dart';

class DatePickerTextField extends StatefulWidget {
  const DatePickerTextField({
    super.key,
    required this.onDateSelected,
    this.initialDate,
  });

  final ValueChanged<DateTime>? onDateSelected;
  final DateTime? initialDate;

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final TextEditingController _controller = TextEditingController();

  DateTime? _selectedDate;

  void _showDateAndTimePicker() async {
    final selected = await context.showDateAndTimePickerDialog(_selectedDate);

    if (selected != null) {
      setState(() {
        _selectedDate = selected;
        _controller.text = selected.formatDate();
      });

      widget.onDateSelected?.call(selected);
    }
  }

  @override
  void initState() {
    super.initState();

    final date = widget.initialDate;

    if (date != null) {
      _selectedDate = date;
      _controller.text = date.formatDate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: _showDateAndTimePicker,
      decoration: const InputDecoration(
        labelText: "Select Date",
        suffixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(),
      ),
    );
  }
}
