// Run analysis on text: longest run of a repeated character and a compact
// run-length listing.
List<(String, int)> runs(String s) {
  final out = <(String, int)>[];
  for (var i = 0; i < s.length;) {
    var j = i;
    while (j < s.length && s[j] == s[i]) {
      j++;
    }
    out.add((s[i], j - i));
    i = j;
  }
  return out;
}

(String, int)? longestRun(String s) =>
    runs(s).isEmpty ? null : runs(s).reduce((a, b) => b.$2 > a.$2 ? b : a);

String compressIfSmaller(String s) {
  final c = runs(s).map((r) => '${r.$1}${r.$2}').join();
  return c.length < s.length ? c : s;
}
