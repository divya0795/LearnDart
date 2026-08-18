// An n-gram is a run of n consecutive items. Word n-grams capture short
// phrases; character n-grams are robust to typos and power fuzzy matching.
List<List<T>> ngrams<T>(List<T> items, int n) => [
  for (var i = 0; i + n <= items.length; i++) items.sublist(i, i + n),
];

List<String> charNgrams(String s, int n) => [
  for (var i = 0; i + n <= s.length; i++) s.substring(i, i + n),
];
