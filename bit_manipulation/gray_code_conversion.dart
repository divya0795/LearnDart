// Gray code orders numbers so consecutive values differ in exactly one
// bit, which avoids glitches in rotary encoders. Convert binary to Gray
// with n ^ (n >> 1).
int toGray(int n) => n ^ (n >> 1);

int fromGray(int g) {
  var n = g;
  for (var shift = 1; (g >> shift) > 0; shift++) {
    n ^= g >> shift;
  }
  return n;
}

bool isOneBitApart(int a, int b) {
  final x = a ^ b;
  return x != 0 && (x & (x - 1)) == 0;
}

void main() {
  for (var i = 0; i < 8; i++) {
    final g = toGray(i);
    print(
      '${i.toRadixString(2).padLeft(3, '0')} -> ${g.toRadixString(2).padLeft(3, '0')} back=${fromGray(g)}',
    );
  }
  var ok = true;
  for (var i = 0; i < 255; i++) {
    if (!isOneBitApart(toGray(i), toGray(i + 1))) ok = false;
  }
  print('neighbours differ by one bit: $ok');
}
