// Generate all well-formed strings of n pairs of parentheses.
//
// Build the string left to right. We may add '(' while fewer than n have
// been opened, and ')' while closes < opens. Those two rules alone rule
// out every invalid prefix, so no dead-end filtering is needed.
//
// The number of results is the n-th Catalan number.

List<String> generateParentheses(int n) {
  final out = <String>[];
  void go(String s, int open, int close) {
    if (s.length == 2 * n) {
      out.add(s);
      return;
    }
    if (open < n) go('$s(', open + 1, close);
    if (close < open) go('$s)', open, close + 1);
  }

  go('', 0, 0);
  return out;
}

void main() {
  print(generateParentheses(3));
  for (var n = 1; n <= 6; n++) {
    print('n=$n -> ${generateParentheses(n).length}');
  }
}
