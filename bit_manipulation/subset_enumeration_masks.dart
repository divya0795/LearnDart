// Enumerate every subset of a mask in decreasing order with the trick
// sub = (sub - 1) & mask. Total work over all masks is 3^n, the core of
// many "subset of subset" dynamic programmes.
List<int> subsetsOf(int mask) {
  final out = <int>[];
  var sub = mask;
  while (true) {
    out.add(sub);
    if (sub == 0) break;
    sub = (sub - 1) & mask;
  }
  return out;
}

String show(int mask) =>
    '{${[for (var i = 0; i < 16; i++)
      if (mask >> i & 1 == 1) i].join(',')}}';

void main() {
  final mask = int.parse('1011', radix: 2);
  for (final s in subsetsOf(mask)) {
    print('${s.toRadixString(2).padLeft(4, '0')} ${show(s)}');
  }
}
