// Palindrome partitioning: split a string so every piece is a palindrome,
// and list all the ways to do it.
//
// At each position try every prefix of the remaining text; if the prefix
// is a palindrome, keep it and recurse on the rest.

bool _isPal(String s, int i, int j) {
  while (i < j) {
    if (s[i++] != s[j--]) return false;
  }
  return true;
}
