import 'package:intl/intl.dart';

extension DatetimeExtensions on DateTime {
  /// Formats the date to a human readable string.
  String formatDate() {
    String formattedDate = DateFormat('d MMMM y HH:mm	').format(this);

    return formattedDate;
  }
}
