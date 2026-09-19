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

String _shift(List<String> sq, String pair, int d) {
  final i = sq.indexOf(pair[0]), j = sq.indexOf(pair[1]);
  final r1 = i ~/ 5, c1 = i % 5, r2 = j ~/ 5, c2 = j % 5;
  if (r1 == r2) return sq[r1 * 5 + (c1 + d) % 5] + sq[r2 * 5 + (c2 + d) % 5];
  if (c1 == c2)
    return sq[((r1 + d) % 5) * 5 + c1] + sq[((r2 + d) % 5) * 5 + c2];
  return sq[r1 * 5 + c2] + sq[r2 * 5 + c1];
}

String encrypt(String text, String key) {
  final sq = buildSquare(key);
  return _pairs(text).map((p) => _shift(sq, p, 1)).join();
}

String decrypt(String cipher, String key) {
  final sq = buildSquare(key);
  return _pairs(cipher).map((p) => _shift(sq, p, 4)).join();
}
