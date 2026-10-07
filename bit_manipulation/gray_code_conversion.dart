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
