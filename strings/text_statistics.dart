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
