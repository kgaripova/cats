/// Parses weight strings like "7 - 10" or "3-5" into a numeric average.
/// Returns null if parsing fails.
double? parseWeightAverage(String? weightStr) {
  if (weightStr == null || weightStr.isEmpty) return null;

  final parts = weightStr.split(RegExp(r'\s*-\s*'));
  if (parts.length == 2) {
    final min = double.tryParse(parts[0].trim());
    final max = double.tryParse(parts[1].trim());
    if (min != null && max != null) return (min + max) / 2;
  }

  return double.tryParse(weightStr.trim());
}
