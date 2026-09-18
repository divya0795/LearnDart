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
