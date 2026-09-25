// Problem 36: sum all numbers below one million that are palindromic in
// both base 10 and base 2 (without leading zeros).
bool isPalindrome(String s) {
  for (var i = 0, j = s.length - 1; i < j; i++, j--) {
    if (s[i] != s[j]) return false;
  }
  return true;
}

List<int> doubleBasePalindromes(int limit) => [
  for (var n = 1; n < limit; n++)
    if (isPalindrome('$n') && isPalindrome(n.toRadixString(2))) n,
];
