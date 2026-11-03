// Word frequency analysis: lower-case, split on non-letters, count, and
// report the most common words with ties broken alphabetically.
Map<String, int> wordFrequencies(String text) {
  final counts = <String, int>{};
  for (final m in RegExp(r"[a-z']+").allMatches(text.toLowerCase())) {
    counts.update(m[0]!, (v) => v + 1, ifAbsent: () => 1);
  }
  return counts;
}

List<MapEntry<String, int>> topWords(
  String text,
  int n, {
  Set<String> stop = const {},
}) {
  final entries =
      wordFrequencies(text).entries.where((e) => !stop.contains(e.key)).toList()
        ..sort((a, b) {
          final c = b.value.compareTo(a.value);
          return c != 0 ? c : a.key.compareTo(b.key);
        });
  return entries.take(n).toList();
}
