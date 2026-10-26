// Convert a non-negative integer between any bases from 2 to 36.
//
// To write n in base b, repeatedly take n % b (the next digit, least
// significant first) and divide n by b. To parse, fold digits left to
// right: value = value * b + digit.

const _digits = '0123456789abcdefghijklmnopqrstuvwxyz';

String toBase(int n, int base) {
  if (base < 2 || base > 36) throw RangeError.range(base, 2, 36, 'base');
  if (n < 0) throw ArgumentError('n must be non-negative');
  if (n == 0) return '0';
  final out = <String>[];
  while (n > 0) {
    out.add(_digits[n % base]);
    n ~/= base;
  }
  return out.reversed.join();
}
