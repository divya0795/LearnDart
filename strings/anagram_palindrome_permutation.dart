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
