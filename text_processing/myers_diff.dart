// A line-based diff: find the longest common subsequence of lines, then
// everything else is an insertion or deletion. (Git uses Myers' O(ND)
// algorithm; this table version is easier to read and gives the same
// minimal edit script length.)
List<String> diff(List<String> a, List<String> b) {
  final dp = List.generate(a.length + 1, (_) => List.filled(b.length + 1, 0));
  for (var i = a.length - 1; i >= 0; i--) {
    for (var j = b.length - 1; j >= 0; j--) {
      dp[i][j] = a[i] == b[j]
          ? dp[i + 1][j + 1] + 1
          : (dp[i + 1][j] > dp[i][j + 1] ? dp[i + 1][j] : dp[i][j + 1]);
    }
  }
  final out = <String>[];
  var i = 0, j = 0;
  while (i < a.length && j < b.length) {
    if (a[i] == b[j]) {
      out.add('  ${a[i]}');
      i++;
      j++;
    } else if (dp[i + 1][j] >= dp[i][j + 1]) {
      out.add('- ${a[i++]}');
    } else {
      out.add('+ ${b[j++]}');
    }
  }
  while (i < a.length) {
    out.add('- ${a[i++]}');
  }
  while (j < b.length) {
    out.add('+ ${b[j++]}');
  }
  return out;
}

List<String> applyDiff(List<String> d) => [
  for (final l in d)
    if (!l.startsWith('- ')) l.substring(2),
];

void main() {
  final a = ['alpha', 'beta', 'gamma', 'delta'];
  final b = ['alpha', 'gamma', 'epsilon', 'delta'];
  final d = diff(a, b);
  d.forEach(print);
  print('applies cleanly: ${applyDiff(d).join(',') == b.join(',')}');
}
