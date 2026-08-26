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

String justify(String line, int width) {
  final ws = line.split(' ');
  if (ws.length == 1) return line.padRight(width);
  final gaps = ws.length - 1;
  final spaces = width - ws.fold(0, (a, w) => a + w.length);
  final b = StringBuffer();
  for (var i = 0; i < ws.length; i++) {
    b.write(ws[i]);
    if (i < gaps) b.write(' ' * (spaces ~/ gaps + (i < spaces % gaps ? 1 : 0)));
  }
  return b.toString();
}
