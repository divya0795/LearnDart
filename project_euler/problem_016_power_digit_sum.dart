// Problem 16: what is the sum of the digits of 2^1000? The number has 302
// digits, far beyond 64-bit ints, so use BigInt.
int digitSum(BigInt n) =>
    n.toString().split('').fold(0, (s, d) => s + int.parse(d));
