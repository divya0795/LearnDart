// Regular expression matching with '.' (any one character) and '*' (zero
// or more of the previous element). dp[i][j] is true if the first i
// characters of the text match the first j characters of the pattern.
bool isMatch(String s, String p) {
  final dp = List.generate(
    s.length + 1,
    (_) => List.filled(p.length + 1, false),
  );
  dp[0][0] = true;
  for (var j = 2; j <= p.length; j++) {
    if (p[j - 1] == '*') dp[0][j] = dp[0][j - 2];
  }
  for (var i = 1; i <= s.length; i++) {
    for (var j = 1; j <= p.length; j++) {
      if (p[j - 1] == '*') {
        dp[i][j] =
            dp[i][j - 2] ||
            ((p[j - 2] == '.' || p[j - 2] == s[i - 1]) && dp[i - 1][j]);
      } else {
        dp[i][j] =
            (p[j - 1] == '.' || p[j - 1] == s[i - 1]) && dp[i - 1][j - 1];
      }
    }
  }
  return dp[s.length][p.length];
}

bool isWildcardMatch(String s, String p) {
  final dp = List.generate(
    s.length + 1,
    (_) => List.filled(p.length + 1, false),
  );
  dp[0][0] = true;
  for (var j = 1; j <= p.length; j++) {
    if (p[j - 1] == '*') dp[0][j] = dp[0][j - 1];
  }
  for (var i = 1; i <= s.length; i++) {
    for (var j = 1; j <= p.length; j++) {
      if (p[j - 1] == '*') {
        dp[i][j] = dp[i][j - 1] || dp[i - 1][j];
      } else {
        dp[i][j] =
            (p[j - 1] == '?' || p[j - 1] == s[i - 1]) && dp[i - 1][j - 1];
      }
    }
  }
  return dp[s.length][p.length];
}
