// Huffman coding: build a prefix-free binary code where frequent symbols
// get short codes and rare ones get long codes.
//
// Repeatedly merge the two least-frequent nodes into a parent until one
// tree remains; the path from the root (left=0, right=1) is each symbol's
// code. No code is a prefix of another, so decoding is unambiguous.
//
// Complexity: O(k log k) to build for k distinct symbols.

class _Node {
  final int freq;
  final String? sym;
  final _Node? left, right;
  _Node(this.freq, {this.sym, this.left, this.right});
}

Map<String, String> huffmanCodes(String text) {
  final freq = <String, int>{};
  for (final c in text.split('')) {
    freq[c] = (freq[c] ?? 0) + 1;
  }
  final nodes = [for (final e in freq.entries) _Node(e.value, sym: e.key)];
  if (nodes.length == 1) return {nodes.first.sym!: '0'};
  while (nodes.length > 1) {
    nodes.sort((a, b) => a.freq.compareTo(b.freq));
    final a = nodes.removeAt(0), b = nodes.removeAt(0);
    nodes.add(_Node(a.freq + b.freq, left: a, right: b));
  }
  final codes = <String, String>{};
  void walk(_Node n, String path) {
    if (n.sym != null) {
      codes[n.sym!] = path;
      return;
    }
    walk(n.left!, '${path}0');
    walk(n.right!, '${path}1');
  }

  walk(nodes.first, '');
  return codes;
}

String encode(String text, Map<String, String> codes) =>
    text.split('').map((c) => codes[c]!).join();

String decode(String bits, Map<String, String> codes) {
  final rev = {for (final e in codes.entries) e.value: e.key};
  final out = StringBuffer();
  var cur = '';
  for (final b in bits.split('')) {
    cur += b;
    if (rev.containsKey(cur)) {
      out.write(rev[cur]);
      cur = '';
    }
  }
  return out.toString();
}

void main() {
  const text = 'abracadabra';
  final codes = huffmanCodes(text);
  final bits = encode(text, codes);
  print(codes);
  print('$bits (${bits.length} bits vs ${text.length * 8} raw)');
  print('round trip ok: ${decode(bits, codes) == text}');
}
