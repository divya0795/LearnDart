// Problem 48: find the last ten digits of 1^1 + 2^2 + ... + 1000^1000.
// Work modulo 10^10 using BigInt modular exponentiation so numbers stay
// small.
String lastDigitsOfSelfPowers(int n, int digits) {
  final mod = BigInt.from(10).pow(digits);
  var sum = BigInt.zero;
  for (var i = 1; i <= n; i++) {
    sum += BigInt.from(i).modPow(BigInt.from(i), mod);
  }
  return (sum % mod).toString().padLeft(digits, '0');
}

void main() {
  print('1..10 last 10 digits: ${lastDigitsOfSelfPowers(10, 10)}');
  print('1..1000 last 10 digits: ${lastDigitsOfSelfPowers(1000, 10)}');
}
