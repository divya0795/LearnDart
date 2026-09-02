// Validate a Roman numeral (1..3999) with the canonical grammar:
// thousands (M up to 3), hundreds, tens and units, each using the
// patterns for 0-9 in its own symbols (e.g. IV, IX, V, VI-VIII).
final _roman = RegExp(
  r'^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$',
);

bool isValidRoman(String s) => s.isNotEmpty && _roman.hasMatch(s);
