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

String encrypt(String text, String key) {
  final t = text.replaceAll(' ', '').toLowerCase();
  final cols = key.length;
  final padded = t.padRight((t.length / cols).ceil() * cols, 'x');
  final out = StringBuffer();
  for (final c in _order(key)) {
    for (var i = c; i < padded.length; i += cols) {
      out.write(padded[i]);
    }
  }
  return out.toString();
}
