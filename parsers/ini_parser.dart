// INI file parser: [section] headers, key = value lines, and ; or #
// comments. Keys before any section go into a "" (global) section.
Map<String, Map<String, String>> parseIni(String text) {
  final out = <String, Map<String, String>>{'': {}};
  var section = '';
  for (final raw in text.split('\n')) {
    final line = raw.trim();
    if (line.isEmpty || line.startsWith(';') || line.startsWith('#')) continue;
    if (line.startsWith('[') && line.endsWith(']')) {
      section = line.substring(1, line.length - 1).trim();
      out.putIfAbsent(section, () => {});
      continue;
    }
    final eq = line.indexOf('=');
    if (eq < 0) throw FormatException('bad line: $line');
    out[section]![line.substring(0, eq).trim()] = line.substring(eq + 1).trim();
  }
  return out;
}
