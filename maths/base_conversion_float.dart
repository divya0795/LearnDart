// Binary expansion of a fraction in [0, 1): repeatedly double and take
// the integer part as the next bit. Shows why 0.1 cannot be stored
// exactly in binary floating point.
String fractionToBinary(double f, {int bits = 24}) {
  final b = StringBuffer('0.');
  for (var i = 0; i < bits && f != 0; i++) {
    f *= 2;
    if (f >= 1) {
      b.write('1');
      f -= 1;
    } else {
      b.write('0');
    }
  }
  return b.toString();
}

void demoSurprises() {
  print('0.1 + 0.2 = ${0.1 + 0.2}');
  print('equal: ${0.1 + 0.2 == 0.3}');
  print('close enough: ${(0.1 + 0.2 - 0.3).abs() < 1e-9}');
}

void main() {
  print('0.5   = ${fractionToBinary(0.5)}');
  print('0.625 = ${fractionToBinary(0.625)}');
  print('0.1   = ${fractionToBinary(0.1)} ...');
  demoSurprises();
}
