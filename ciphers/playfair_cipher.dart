// Playfair cipher: encrypts pairs of letters (digraphs) using a 5x5 key
// square built from a keyword (I and J share a cell).
//
// For each pair: same row -> take the letter to the right of each; same
// column -> take the letter below each; otherwise form a rectangle and
// swap columns. Decryption uses left/up instead.

List<String> buildSquare(String key) {
  final seen = <String>{};
  for (final c in (key + 'abcdefghijklmnopqrstuvwxyz').toLowerCase().split(
    '',
  )) {
    final ch = c == 'j' ? 'i' : c;
    if (RegExp('[a-z]').hasMatch(ch)) seen.add(ch);
  }
  return seen.toList();
}

List<String> _pairs(String text) {
  final t = text
      .toLowerCase()
      .replaceAll('j', 'i')
      .replaceAll(RegExp('[^a-z]'), '');
  final out = <String>[];
  for (var i = 0; i < t.length;) {
    final a = t[i];
    final b = i + 1 < t.length ? t[i + 1] : 'x';
    if (a == b) {
      out.add('${a}x');
      i++;
    } else {
      out.add('$a$b');
      i += 2;
    }
  }
  return out;
}
