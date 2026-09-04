// Query string handling: split on & and =, percent-decode keys and
// values, and collect repeated keys into lists. Dart's Uri helpers do the
// decoding; the grouping logic is what we add.
Map<String, List<String>> parseQuery(String q) {
  final out = <String, List<String>>{};
  if (q.startsWith('?')) q = q.substring(1);
  for (final part in q.split('&')) {
    if (part.isEmpty) continue;
    final eq = part.indexOf('=');
    final k = Uri.decodeQueryComponent(eq < 0 ? part : part.substring(0, eq));
    final v = eq < 0 ? '' : Uri.decodeQueryComponent(part.substring(eq + 1));
    out.putIfAbsent(k, () => []).add(v);
  }
  return out;
}
