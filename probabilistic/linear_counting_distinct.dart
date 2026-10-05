// Linear counting: estimate the number of distinct items using a bitmap of
// m bits. Hash each item to a bit and set it; with z bits still zero,
// the estimate is m * ln(m / z). Accurate while the bitmap is not nearly
// full.
import 'dart:math';

int _h(String s) {
  var h = 0x811c9dc5;
  for (final c in s.codeUnits) {
    h = ((h ^ c) * 0x01000193) & 0xffffffff;
  }
  return h;
}

double estimateDistinct(Iterable<String> items, int m) {
  final bits = List.filled(m, false);
  for (final s in items) {
    bits[_h(s) % m] = true;
  }
  final zeros = bits.where((b) => !b).length;
  return zeros == 0 ? double.infinity : m * log(m / zeros);
}
