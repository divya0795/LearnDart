// Extension methods add members to existing types without subclassing or
// editing them. Here we teach String a few helpers.
extension StringX on String {
  String get capitalized =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);
  bool get isPalindrome {
    final s = toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return s == s.split('').reversed.join();
  }
}
