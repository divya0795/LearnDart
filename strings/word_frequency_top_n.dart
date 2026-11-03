// Word frequency analysis: lower-case, split on non-letters, count, and
// report the most common words with ties broken alphabetically.
Map<String, int> wordFrequencies(String text) {
  final counts = <String, int>{};
  for (final m in RegExp(r"[a-z']+").allMatches(text.toLowerCase())) {
    counts.update(m[0]!, (v) => v + 1, ifAbsent: () => 1);
  }
  return counts;
}
