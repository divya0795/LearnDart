// Collatz steps by recursion: if n is even halve it, if odd compute 3n+1,
// and count steps until reaching 1. It is unproven that every start
// terminates, but no counterexample is known.

int steps(int n) {
  if (n == 1) return 0;
  return 1 + steps(n.isEven ? n ~/ 2 : 3 * n + 1);
}

final _memo = <int, int>{1: 0};
int stepsMemo(int n) =>
    _memo[n] ??= 1 + stepsMemo(n.isEven ? n ~/ 2 : 3 * n + 1);

void main() {
  print('27 takes ${steps(27)} steps');
  var best = 1;
  for (var i = 1; i < 1000; i++) {
    if (stepsMemo(i) > stepsMemo(best)) best = i;
  }
  print('longest under 1000: $best with ${stepsMemo(best)} steps');
}
