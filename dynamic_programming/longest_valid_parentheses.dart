// Longest valid (well-formed) parentheses substring.
// Let dp[i] be the length of the longest valid substring ending at i.
// If s[i] is ')' it either closes an adjacent '(' (dp[i-2] + 2) or closes
// a valid block that ends at i-1 (dp[i-1] + 2 + whatever precedes it).
int longestValidParentheses(String s) {
  final dp = List.filled(s.length, 0);
  var best = 0;
  for (var i = 1; i < s.length; i++) {
    if (s[i] != ')') continue;
    if (s[i - 1] == '(') {
      dp[i] = (i >= 2 ? dp[i - 2] : 0) + 2;
    } else {
      final j = i - dp[i - 1] - 1;
      if (j >= 0 && s[j] == '(') {
        dp[i] = dp[i - 1] + 2 + (j >= 1 ? dp[j - 1] : 0);
      }
    }
    if (dp[i] > best) best = dp[i];
  }
  return best;
}

int longestValidStack(String s) {
  final st = <int>[-1];
  var best = 0;
  for (var i = 0; i < s.length; i++) {
    if (s[i] == '(') {
      st.add(i);
    } else {
      st.removeLast();
      if (st.isEmpty) {
        st.add(i);
      } else if (i - st.last > best) {
        best = i - st.last;
      }
    }
  }
  return best;
}

void main() {
  for (final s in ['(()', ')()())', '()(()', '', '((()))']) {
    print('"$s" -> ${longestValidParentheses(s)} / ${longestValidStack(s)}');
  }
}
