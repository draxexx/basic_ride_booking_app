extension StringExtensions on String {
  String shortenText({int maxLength = 20}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}
