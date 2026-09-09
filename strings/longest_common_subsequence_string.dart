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

String lcs(String a, String b) {
  final dp = lcsTable(a, b);
  final out = <String>[];
  var i = a.length, j = b.length;
  while (i > 0 && j > 0) {
    if (a[i - 1] == b[j - 1]) {
      out.add(a[i - 1]);
      i--;
      j--;
    } else if (dp[i - 1][j] >= dp[i][j - 1]) {
      i--;
    } else {
      j--;
    }
  }
  return out.reversed.join();
}

String diffView(String a, String b) {
  final common = lcs(a, b);
  String mark(String s) {
    var k = 0;
    return s
        .split('')
        .map(
          (c) =>
              k < common.length && c == common[k] ? (k++ >= 0 ? c : c) : '[$c]',
        )
        .join();
  }

  return '${mark(a)}  |  ${mark(b)}';
}

void main() {
  print(lcs('AGGTAB', 'GXTXAYB'));
  print(lcs('abc', 'xyz').isEmpty);
  print(diffView('kitten', 'sitting'));
}
