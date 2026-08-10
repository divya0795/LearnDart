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

extension IniAccess on Map<String, Map<String, String>> {
  String? get(String section, String key) => this[section]?[key];
  int getInt(String section, String key, int fallback) =>
      int.tryParse(get(section, key) ?? '') ?? fallback;
  bool getBool(String section, String key, bool fallback) {
    final v = get(section, key)?.toLowerCase();
    if (v == null) return fallback;
    return const ['1', 'true', 'yes', 'on'].contains(v);
  }
}

void main() {
  const text = '''
; global
name = demo
[server]
port = 8080
debug = yes
# comment
[client]
retries = 3
''';
  final ini = parseIni(text);
  print(ini);
  print(ini.getInt('server', 'port', 80));
  print(ini.getBool('server', 'debug', false));
  print(ini.getInt('client', 'timeout', 30));
}
