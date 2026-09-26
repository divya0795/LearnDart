// Longest palindromic substring by expanding around every centre.
//
// A palindrome mirrors around its centre, so for each of the 2n-1 possible
// centres (a character, or the gap between two) grow outward while the two
// ends match. Keep the longest span found.
//
// Complexity: O(n^2) time, O(1) space.
String longestPalindrome(String s) {
  if (s.isEmpty) return '';
  var start = 0, len = 1;
  int expand(int l, int r) {
    while (l >= 0 && r < s.length && s[l] == s[r]) {
      l--;
      r++;
    }
    return r - l - 1;
  }

  for (var i = 0; i < s.length; i++) {
    final n = expand(i, i) > expand(i, i + 1) ? expand(i, i) : expand(i, i + 1);
    if (n > len) {
      len = n;
      start = i - (n - 1) ~/ 2;
    }
  }
  return s.substring(start, start + len);
}
