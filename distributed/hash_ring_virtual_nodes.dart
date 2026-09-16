// Consistent hashing with virtual nodes: each physical node appears at
// many points on the hash ring, which spreads keys more evenly and means
// removing a node only moves its own keys.
int _hash(String s) {
  var h = 0x811c9dc5;
  for (final c in s.codeUnits) {
    h = ((h ^ c) * 0x01000193) & 0xffffffff;
  }
  return h;
}

class Ring {
  final _points = <int, String>{};
  final int vnodes;
  Ring(this.vnodes);

  void add(String node) {
    for (var i = 0; i < vnodes; i++) {
      _points[_hash('$node#$i')] = node;
    }
  }

  void remove(String node) => _points.removeWhere((_, n) => n == node);

  String lookup(String key) {
    final keys = _points.keys.toList()..sort();
    final h = _hash(key);
    final k = keys.firstWhere((p) => p >= h, orElse: () => keys.first);
    return _points[k]!;
  }
}

void main() {
  final ring = Ring(100)
    ..add('A')
    ..add('B')
    ..add('C');
  final keys = [for (var i = 0; i < 3000; i++) 'key$i'];
  final counts = <String, int>{};
  final before = {for (final k in keys) k: ring.lookup(k)};
  for (final n in before.values) {
    counts[n] = (counts[n] ?? 0) + 1;
  }
  print('load: $counts');
  ring.remove('C');
  final moved = keys.where((k) => before[k] != ring.lookup(k)).length;
  print('moved after removing C: $moved (C owned ${counts['C']})');
}
