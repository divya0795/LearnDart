// Word wrap: break text into lines no wider than a limit without splitting
// words. Greedy wrapping puts as many words as fit on each line.
List<String> wrap(String text, int width) {
  final lines = <String>[];
  var line = '';
  for (final w in text.split(RegExp(r'\s+')).where((w) => w.isNotEmpty)) {
    if (line.isEmpty) {
      line = w;
    } else if (line.length + 1 + w.length <= width) {
      line += ' $w';
    } else {
      lines.add(line);
      line = w;
    }
  }
  if (line.isNotEmpty) lines.add(line);
  return lines;
}
