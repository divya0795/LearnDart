// Delta encoding: store the first value and then only the differences
// between neighbours. Slowly changing data (timestamps, sensor readings)
// turns into small numbers that compress far better afterwards.
List<int> deltaEncode(List<int> a) => [
  for (var i = 0; i < a.length; i++) i == 0 ? a[0] : a[i] - a[i - 1],
];

List<int> deltaDecode(List<int> d) {
  final out = <int>[];
  var acc = 0;
  for (final x in d) {
    acc += x;
    out.add(acc);
  }
  return out;
}

void main() {
  final ts = [1700000000, 1700000003, 1700000007, 1700000008, 1700000015];
  final d = deltaEncode(ts);
  print(d);
  print('round trip: ${deltaDecode(d).toString() == ts.toString()}');
}
