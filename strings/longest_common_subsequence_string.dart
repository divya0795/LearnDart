// Longest common subsequence (LCS) of two strings, with the table kept so
// the actual subsequence can be recovered. dp[i][j] is the LCS length of
// the first i chars of a and first j chars of b.
List<List<int>> lcsTable(String a, String b) {
  final dp = List.generate(a.length + 1, (_) => List.filled(b.length + 1, 0));
  for (var i = 1; i <= a.length; i++) {
    for (var j = 1; j <= b.length; j++) {
      dp[i][j] = a[i - 1] == b[j - 1]
          ? dp[i - 1][j - 1] + 1
          : (dp[i - 1][j] > dp[i][j - 1] ? dp[i - 1][j] : dp[i][j - 1]);
    }
  }
  return dp;
}
