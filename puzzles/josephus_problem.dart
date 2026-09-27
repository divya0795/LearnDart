// Josephus problem: n people stand in a circle and every k-th is removed
// until one remains. Simulation is O(n*k); the recurrence
// J(n) = (J(n-1) + k) mod n, with J(1) = 0, gives the survivor in O(n).
int josephusSimulate(int n, int k) {
  final people = List.generate(n, (i) => i);
  var idx = 0;
  while (people.length > 1) {
    idx = (idx + k - 1) % people.length;
    people.removeAt(idx);
  }
  return people.first;
}

int josephus(int n, int k) {
  var r = 0;
  for (var i = 2; i <= n; i++) {
    r = (r + k) % i;
  }
  return r;
}

void main() {
  for (final (n, k) in [(7, 3), (10, 2), (41, 3)]) {
    print(
      'n=$n k=$k survivor (0-based): ${josephus(n, k)} / sim ${josephusSimulate(n, k)}',
    );
  }
}
