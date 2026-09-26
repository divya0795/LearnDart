// A bit set stores membership of integers 0..63 in a single int: bit i is
// 1 when i is in the set. Union, intersection and difference become single
// bitwise operations.
class BitSet {
  final int bits;
  const BitSet([this.bits = 0]);

  BitSet add(int i) => BitSet(bits | (1 << i));
  BitSet remove(int i) => BitSet(bits & ~(1 << i));
  bool contains(int i) => bits & (1 << i) != 0;
  int get length {
    var n = bits, c = 0;
    while (n != 0) {
      n &= n - 1;
      c++;
    }
    return c;
  }

  BitSet union(BitSet o) => BitSet(bits | o.bits);
  BitSet intersect(BitSet o) => BitSet(bits & o.bits);
  BitSet difference(BitSet o) => BitSet(bits & ~o.bits);

  List<int> toList() => [
    for (var i = 0; i < 63; i++)
      if (contains(i)) i,
  ];
}

void main() {
  final a = const BitSet().add(1).add(3).add(5).add(7);
  final b = const BitSet().add(3).add(4).add(5);
  print('a=${a.toList()} b=${b.toList()}');
  print('union ${a.union(b).toList()}');
  print('intersect ${a.intersect(b).toList()}');
  print('a-b ${a.difference(b).toList()} size ${a.difference(b).length}');
}
