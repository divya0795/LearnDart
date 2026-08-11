// Palindrome permutation: can the characters of a string be rearranged
// into a palindrome? Yes exactly when at most one character has an odd
// count (it goes in the middle).
bool canFormPalindrome(String s) {
  final odd = <String>{};
  for (final c
      in s.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '').split('')) {
    if (!odd.remove(c)) odd.add(c);
  }
  return odd.length <= 1;
}

String? makePalindrome(String s) {
  final counts = <String, int>{};
  for (final c in s.split('')) {
    counts[c] = (counts[c] ?? 0) + 1;
  }
  final odd = counts.entries
      .where((e) => e.value.isOdd)
      .map((e) => e.key)
      .toList();
  if (odd.length > 1) return null;
  final half = [for (final e in counts.entries) e.key * (e.value ~/ 2)].join();
  return half + (odd.isEmpty ? '' : odd.first) + half.split('').reversed.join();
}
