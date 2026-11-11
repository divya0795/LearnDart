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

List<List<String>> partition(String s) {
  final out = <List<String>>[], path = <String>[];
  void go(int start) {
    if (start == s.length) {
      out.add([...path]);
      return;
    }
    for (var end = start; end < s.length; end++) {
      if (_isPal(s, start, end)) {
        path.add(s.substring(start, end + 1));
        go(end + 1);
        path.removeLast();
      }
    }
  }

  go(0);
  return out;
}
