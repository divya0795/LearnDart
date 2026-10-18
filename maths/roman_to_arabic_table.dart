// Integer to Roman numeral using a greedy table that includes the
// subtractive pairs (CM, CD, XC, XL, IX, IV) so the largest symbol is
// always taken first.
const _table = <(int, String)>[
  (1000, 'M'),
  (900, 'CM'),
  (500, 'D'),
  (400, 'CD'),
  (100, 'C'),
  (90, 'XC'),
  (50, 'L'),
  (40, 'XL'),
  (10, 'X'),
  (9, 'IX'),
  (5, 'V'),
  (4, 'IV'),
  (1, 'I'),
];

String toRoman(int n) {
  if (n < 1 || n > 3999) throw RangeError.range(n, 1, 3999);
  final b = StringBuffer();
  for (final (v, s) in _table) {
    while (n >= v) {
      b.write(s);
      n -= v;
    }
  }
  return b.toString();
}

int fromRoman(String s) {
  var i = 0, total = 0;
  for (final (v, sym) in _table) {
    while (s.startsWith(sym, i)) {
      total += v;
      i += sym.length;
    }
  }
  if (i != s.length) throw FormatException('bad numeral $s');
  return total;
}
