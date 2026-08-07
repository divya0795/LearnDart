// Longest arithmetic subsequence: the longest subsequence whose
// consecutive differences are all equal. dp[i][d] is the length of the
// longest such subsequence ending at i with common difference d.
int longestArithSeq(List<int> a) {
  if (a.length < 3) return a.length;
  final dp = List.generate(a.length, (_) => <int, int>{});
  var best = 2;
  for (var i = 1; i < a.length; i++) {
    for (var j = 0; j < i; j++) {
      final d = a[i] - a[j];
      final len = (dp[j][d] ?? 1) + 1;
      if (len > (dp[i][d] ?? 0)) dp[i][d] = len;
      if (len > best) best = len;
    }
  }
  return best;
}
