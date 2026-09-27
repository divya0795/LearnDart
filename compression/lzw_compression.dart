// LZW compression: start with a dictionary of single characters; read the
// longest known prefix, output its code, and add prefix+next character as
// a new dictionary entry. No dictionary is transmitted -- the decoder
// rebuilds the same one.
List<int> lzwEncode(String s) {
  final dict = <String, int>{
    for (var i = 0; i < 256; i++) String.fromCharCode(i): i,
  };
  var w = '';
  final out = <int>[];
  for (final c in s.split('')) {
    final wc = w + c;
    if (dict.containsKey(wc)) {
      w = wc;
    } else {
      out.add(dict[w]!);
      dict[wc] = dict.length;
      w = c;
    }
  }
  if (w.isNotEmpty) out.add(dict[w]!);
  return out;
}

String lzwDecode(List<int> codes) {
  final dict = <int, String>{
    for (var i = 0; i < 256; i++) i: String.fromCharCode(i),
  };
  var w = dict[codes.first]!;
  final out = StringBuffer(w);
  for (final k in codes.skip(1)) {
    final entry = dict[k] ?? (w + w[0]);
    out.write(entry);
    dict[dict.length] = w + entry[0];
    w = entry;
  }
  return out.toString();
}
