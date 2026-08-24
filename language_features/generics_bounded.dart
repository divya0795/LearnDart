// Generics let one implementation work for many types. A bound such as
// `T extends Comparable` lets the body use the capabilities of T.
T maxOf<T extends Comparable<dynamic>>(List<T> xs) {
  var best = xs.first;
  for (final x in xs.skip(1)) {
    if (x.compareTo(best) > 0) best = x;
  }
  return best;
}

class Stack<T> {
  final _items = <T>[];
  void push(T x) => _items.add(x);
  T pop() => _items.removeLast();
  T get peek => _items.last;
  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;
}

class Pair<A, B> {
  final A first;
  final B second;
  const Pair(this.first, this.second);

  Pair<B, A> get swapped => Pair(second, first);
  Pair<C, B> mapFirst<C>(C Function(A) f) => Pair(f(first), second);

  @override
  String toString() => '($first, $second)';
}

void main() {
  print(maxOf([3, 9, 2]));
  print(maxOf(['pear', 'apple', 'zebra']));
  final s = Stack<int>()
    ..push(1)
    ..push(2);
  print('${s.pop()} ${s.peek} ${s.length}');
  const p = Pair('x', 1);
  print('${p.swapped} ${p.mapFirst((s) => s.length)}');
}
