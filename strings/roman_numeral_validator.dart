// Validate a Roman numeral (1..3999) with the canonical grammar:
// thousands (M up to 3), hundreds, tens and units, each using the
// patterns for 0-9 in its own symbols (e.g. IV, IX, V, VI-VIII).
final _roman = RegExp(
  r'^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$',
);

bool isValidRoman(String s) => s.isNotEmpty && _roman.hasMatch(s);

int parseRoman(String s) {
  if (!isValidRoman(s)) throw FormatException('not a roman numeral: $s');
  const v = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000};
  var total = 0;
  for (var i = 0; i < s.length; i++) {
    final cur = v[s[i]]!;
    final next = i + 1 < s.length ? v[s[i + 1]]! : 0;
    total += cur < next ? -cur : cur;
  }
  return total;
}

void main() {
  for (final s in ['MCMXCIV', 'XLII', 'IIII', 'VX', 'MMMM', '']) {
    print(
      '"$s": valid=${isValidRoman(s)}${isValidRoman(s) ? ' = ${parseRoman(s)}' : ''}',
    );
  }
}
