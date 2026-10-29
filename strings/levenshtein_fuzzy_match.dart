// Levenshtein distance: the minimum number of single-character inserts,
// deletes or substitutions needed to turn one string into another. Uses
// two rolling rows so memory is O(min(n, m)).
int levenshtein(String a, String b) {
  if (a.length < b.length) return levenshtein(b, a);
  var prev = List.generate(b.length + 1, (j) => j);
  for (var i = 1; i <= a.length; i++) {
    final cur = [i, ...List.filled(b.length, 0)];
    for (var j = 1; j <= b.length; j++) {
      final cost = a[i - 1] == b[j - 1] ? 0 : 1;
      cur[j] = [
        prev[j] + 1,
        cur[j - 1] + 1,
        prev[j - 1] + cost,
      ].reduce((x, y) => x < y ? x : y);
    }
    prev = cur;
  }
  return prev[b.length];
}
