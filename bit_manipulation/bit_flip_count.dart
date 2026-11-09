// Bits to flip to turn a into b: XOR the numbers (differing bits become 1)
// and count the ones.
//
// Counting uses Brian Kernighan's trick: n & (n - 1) clears the lowest
// set bit, so the loop runs once per set bit rather than once per bit.

int popCount(int n) {
  var c = 0;
  while (n != 0) {
    n &= n - 1;
    c++;
  }
  return c;
}

int bitFlips(int a, int b) => popCount(a ^ b);

void main() {
  print('flips 29 -> 15: ${bitFlips(29, 15)}');
  print('flips 10 -> 10: ${bitFlips(10, 10)}');
  print('flips 0 -> 255: ${bitFlips(0, 255)}');
}
