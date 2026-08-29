// Check whether b is a rotation of a: it must have the same length and
// appear inside a + a (e.g. "waterbottle" rotates to "erbottlewat").
bool isRotation(String a, String b) =>
    a.length == b.length && (a + a).contains(b);

String minRotation(String s) {
  var best = s;
  for (var i = 1; i < s.length; i++) {
    final r = s.substring(i) + s.substring(0, i);
    if (r.compareTo(best) < 0) best = r;
  }
  return best;
}

String? repeatingUnit(String s) {
  final i = (s + s).indexOf(s, 1);
  return i < s.length ? s.substring(0, i) : null;
}

void main() {
  print(isRotation('waterbottle', 'erbottlewat'));
  print(isRotation('abc', 'acb'));
  print(minRotation('bca'));
  print(repeatingUnit('abcabcabc'));
  print(repeatingUnit('abcd'));
}
