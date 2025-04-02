extension StringExtensions on String {
  /// Shortens the string to a specified length
  String shortenText({int maxLength = 20}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}
