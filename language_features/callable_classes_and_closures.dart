// A closure is a function that remembers the variables around where it was
// created. Each call to the factory makes an independent counter.
int Function() makeCounter() {
  var n = 0;
  return () => ++n;
}

Function(int) makeAdder(int k) =>
    (int x) => x + k;
