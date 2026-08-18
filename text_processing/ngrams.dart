// An n-gram is a run of n consecutive items. Word n-grams capture short
// phrases; character n-grams are robust to typos and power fuzzy matching.
List<List<T>> ngrams<T>(List<T> items, int n) => [
  for (var i = 0; i + n <= items.length; i++) items.sublist(i, i + n),
];

List<String> charNgrams(String s, int n) => [
  for (var i = 0; i + n <= s.length; i++) s.substring(i, i + n),
];

Map<String, int> countNgrams(List<String> words, int n) {
  final counts = <String, int>{};
  for (final g in ngrams(words, n)) {
    counts.update(g.join(' '), (v) => v + 1, ifAbsent: () => 1);
  }
  return counts;
}

double diceSimilarity(String a, String b) {
  final x = charNgrams(a.toLowerCase(), 2), y = charNgrams(b.toLowerCase(), 2);
  if (x.isEmpty || y.isEmpty) return 0;
  final pool = [...y];
  var shared = 0;
  for (final g in x) {
    if (pool.remove(g)) shared++;
  }
  return 2 * shared / (x.length + y.length);
}

void main() {
  final w = 'to be or not to be that is the question to be'.split(' ');
  print(ngrams(w, 3).take(3).toList());
  print(
    (countNgrams(w, 2).entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value)))
        .take(3)
        .toList(),
  );
  print(diceSimilarity('night', 'nacht'));
  print(diceSimilarity('context', 'contact'));
}
