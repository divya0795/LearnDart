// Brace expansion as in shells: "file{1,2}.txt" -> file1.txt, file2.txt.
// Find the first top-level {...}, split its comma-separated choices
// (respecting nesting), and recurse on every prefix+choice+suffix.
List<String> expand(String s) {
  final open = s.indexOf('{');
  if (open < 0) return [s];
  var depth = 0, close = -1;
  final choices = <String>[];
  var start = open + 1;
  for (var i = open; i < s.length; i++) {
    if (s[i] == '{') depth++;
    if (s[i] == '}') {
      depth--;
      if (depth == 0) {
        choices.add(s.substring(start, i));
        close = i;
        break;
      }
    }
    if (s[i] == ',' && depth == 1) {
      choices.add(s.substring(start, i));
      start = i + 1;
    }
  }
  if (close < 0) return [s];
  return [
    for (final c in choices)
      for (final rest in expand(s.substring(close + 1)))
        ...expand(s.substring(0, open) + c).map((p) => p + rest),
  ];
}
