// Columnar transposition: write the plaintext in rows under a keyword,
// then read the columns out in alphabetical order of the keyword letters.
// Letters keep their identity; only their positions change.

List<int> _order(String key) {
  final idx = List.generate(key.length, (i) => i);
  idx.sort((a, b) {
    final c = key[a].compareTo(key[b]);
    return c != 0 ? c : a.compareTo(b);
  });
  return idx;
}
