// Goldbach's conjecture says every even number > 2 is the sum of two
// primes. It is unproven, but easy to check for small values.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

(int, int)? goldbach(int n) {
  for (var p = 2; p <= n ~/ 2; p++) {
    if (isPrime(p) && isPrime(n - p)) return (p, n - p);
  }
  return null;
}
