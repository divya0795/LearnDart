// Bloom filter: a compact set that answers "definitely not present" or
// "probably present". It never gives false negatives; false positives
// occur at a rate controlled by bit-array size m and hash count k.
//
// Adding sets k bits (one per hash); querying checks all k are set. Two
// different items can happen to cover each other's bits, hence false
// positives. Items cannot be removed.
//
// Hashes use double hashing: h_i = h1 + i*h2, a standard way to derive k
// hash functions from two.

class BloomFilter {
  final int m, k;
  final List<bool> _bits;
  BloomFilter(this.m, this.k) : _bits = List.filled(m, false);

  int _h(String s, int seed) {
    var h = 2166136261 ^ seed;
    for (final c in s.codeUnits) {
      h = ((h ^ c) * 16777619) & 0x7fffffff;
    }
    return h;
  }

  Iterable<int> _idx(String s) sync* {
    final h1 = _h(s, 0), h2 = _h(s, 0x9e3779b) | 1;
    for (var i = 0; i < k; i++) {
      yield (h1 + i * h2) % m;
    }
  }

  void add(String s) {
    for (final i in _idx(s)) {
      _bits[i] = true;
    }
  }

  bool mightContain(String s) => _idx(s).every((i) => _bits[i]);
}

void main() {
  final bf = BloomFilter(2000, 4);
  for (var i = 0; i < 200; i++) {
    bf.add('user$i');
  }
  final missing = [for (var i = 0; i < 200; i++) 'user$i']
      .where((s) => !bf.mightContain(s))
      .length;
  print('false negatives: $missing (must be 0)');
  final fp = [for (var i = 1000; i < 2000; i++) 'user$i']
      .where(bf.mightContain)
      .length;
  print('false positives: $fp / 1000');
}
