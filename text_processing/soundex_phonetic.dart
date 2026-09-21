// Soundex maps similar-sounding names to the same 4-character code: keep
// the first letter, replace consonants by digit classes, drop vowels and
// repeated adjacent codes, and pad/truncate to length 4.
String soundex(String name) {
  const codes = {
    'b': '1',
    'f': '1',
    'p': '1',
    'v': '1',
    'c': '2',
    'g': '2',
    'j': '2',
    'k': '2',
    'q': '2',
    's': '2',
    'x': '2',
    'z': '2',
    'd': '3',
    't': '3',
    'l': '4',
    'm': '5',
    'n': '5',
    'r': '6',
  };
  final letters = name.toLowerCase().replaceAll(RegExp('[^a-z]'), '');
  if (letters.isEmpty) return '';
  final out = StringBuffer(letters[0].toUpperCase());
  var prev = codes[letters[0]] ?? '';
  for (var i = 1; i < letters.length && out.length < 4; i++) {
    final c = letters[i];
    final code = codes[c] ?? '';
    if (code.isNotEmpty && code != prev) out.write(code);
    if (c != 'h' && c != 'w') prev = code;
  }
  return out.toString().padRight(4, '0');
}

Map<String, List<String>> groupBySound(List<String> names) {
  final m = <String, List<String>>{};
  for (final n in names) {
    m.putIfAbsent(soundex(n), () => []).add(n);
  }
  return m;
}

void main() {
  for (final n in [
    'Robert',
    'Rupert',
    'Rubin',
    'Ashcraft',
    'Tymczak',
    'Pfister',
  ]) {
    print('$n -> ${soundex(n)}');
  }
  print(groupBySound(['Smith', 'Smyth', 'Smythe', 'Jones', 'Johns']));
}
