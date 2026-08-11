// Letter combinations of a phone number: every string you could spell by
// pressing digits 2-9 on an old phone keypad.
//
// Each digit maps to 3-4 letters. Depth-first search picks one letter per
// digit; reaching the end of the digits yields a complete word.

const _keys = {
  '2': 'abc',
  '3': 'def',
  '4': 'ghi',
  '5': 'jkl',
  '6': 'mno',
  '7': 'pqrs',
  '8': 'tuv',
  '9': 'wxyz',
};

List<String> letterCombinations(String digits) {
  if (digits.isEmpty) return [];
  final out = <String>[];
  void go(int i, String s) {
    if (i == digits.length) {
      out.add(s);
      return;
    }
    for (final c in _keys[digits[i]]!.split('')) {
      go(i + 1, s + c);
    }
  }

  go(0, '');
  return out;
}
