// Perfect squares: the fewest square numbers that add up to n. A coin
// change problem where the coins are 1, 4, 9, 16, ...:
// dp[i] = 1 + min(dp[i - k*k]).
int numSquares(int n) {
  final dp = List.filled(n + 1, 1 << 30)..[0] = 0;
  for (var i = 1; i <= n; i++) {
    for (var k = 1; k * k <= i; k++) {
      final c = dp[i - k * k] + 1;
      if (c < dp[i]) dp[i] = c;
    }
  }
  return dp[n];
}

List<int> squaresFor(int n) {
  final dp = List.filled(n + 1, 1 << 30)..[0] = 0;
  final pick = List.filled(n + 1, 0);
  for (var i = 1; i <= n; i++) {
    for (var k = 1; k * k <= i; k++) {
      if (dp[i - k * k] + 1 < dp[i]) {
        dp[i] = dp[i - k * k] + 1;
        pick[i] = k * k;
      }
    }
  }
  final out = <int>[];
  for (var i = n; i > 0; i -= pick[i]) {
    out.add(pick[i]);
  }
  return out;
}
