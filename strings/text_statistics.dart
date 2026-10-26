// Basic text statistics: vowels, consonants, digits, spaces and the most
// common letter.
({int vowels, int consonants, int digits, int spaces}) stats(String s) {
  var v = 0, c = 0, d = 0, sp = 0;
  for (final ch in s.toLowerCase().split('')) {
    if ('aeiou'.contains(ch)) {
      v++;
    } else if (RegExp('[a-z]').hasMatch(ch)) {
      c++;
    } else if (RegExp('[0-9]').hasMatch(ch)) {
      d++;
    } else if (ch == ' ') {
      sp++;
    }
  }
  return (vowels: v, consonants: c, digits: d, spaces: sp);
}

String? mostCommonLetter(String s) {
  final counts = <String, int>{};
  for (final ch in s.toLowerCase().split('')) {
    if (RegExp('[a-z]').hasMatch(ch)) counts[ch] = (counts[ch] ?? 0) + 1;
  }
  if (counts.isEmpty) return null;
  return counts.entries.reduce((a, b) => b.value > a.value ? b : a).key;
}

void main() {
  const s = 'Dart 3 is a great language, 2 of 3 agree';
  print(stats(s));
  print(mostCommonLetter(s));
  print(mostCommonLetter('123'));
}
