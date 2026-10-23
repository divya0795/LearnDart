// A closure is a function that remembers the variables around where it was
// created. Each call to the factory makes an independent counter.
int Function() makeCounter() {
  var n = 0;
  return () => ++n;
}

Function(int) makeAdder(int k) =>
    (int x) => x + k;

class Multiplier {
  final int k;
  Multiplier(this.k);
  int call(int x) => x * k;
}

int apply(int Function(int) f, int x) => f(x);

List<int> compose(List<int Function(int)> fs, List<int> xs) => [
  for (final x in xs) fs.fold(x, (acc, f) => f(acc)),
];

void main() {
  final a = makeCounter(), b = makeCounter();
  print('${a()} ${a()} ${b()}');
  print(makeAdder(10)(5));
  final triple = Multiplier(3);
  print('${triple(4)} ${apply(triple.call, 5)}');
  print(compose([(x) => x + 1, triple.call, (x) => x - 2], [1, 2, 3]));
}
