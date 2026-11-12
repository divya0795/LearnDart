// Longest substring that can be made of one repeated letter by replacing
// at most k characters.
//
// Slide a window; it is valid while (window length - count of the most
// frequent letter in it) <= k, because that many characters would need
// replacing. Grow the right edge, shrink the left when invalid.
//
// Complexity: O(n) time.
int characterReplacement(String s, int k) {
  final count = List.filled(26, 0);
  var left = 0, maxFreq = 0, best = 0;
  for (var right = 0; right < s.length; right++) {
    final c = s.codeUnitAt(right) - 65;
    count[c]++;
    if (count[c] > maxFreq) maxFreq = count[c];
    while (right - left + 1 - maxFreq > k) {
      count[s.codeUnitAt(left) - 65]--;
      left++;
    }
    if (right - left + 1 > best) best = right - left + 1;
  }
  return best;
}

void main() {
  print(characterReplacement('ABAB', 2));
  print(characterReplacement('AABABBA', 1));
  print(characterReplacement('AAAA', 0));
}
