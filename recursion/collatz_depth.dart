// Collatz steps by recursion: if n is even halve it, if odd compute 3n+1,
// and count steps until reaching 1. It is unproven that every start
// terminates, but no counterexample is known.

int steps(int n) {
  if (n == 1) return 0;
  return 1 + steps(n.isEven ? n ~/ 2 : 3 * n + 1);
}
