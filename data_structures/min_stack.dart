// Min stack: push, pop, top and getMin all in O(1). Each entry stores the
// value together with the minimum of everything at or below it, so the
// minimum is always the top entry's recorded minimum.
class MinStack {
  final _items = <(int, int)>[]; // (value, min so far)

  bool get isEmpty => _items.isEmpty;

  void push(int v) {
    final m = _items.isEmpty || v < _items.last.$2 ? v : _items.last.$2;
    _items.add((v, m));
  }

  int pop() => _items.removeLast().$1;
  int get top => _items.last.$1;
  int get min => _items.last.$2;
}
