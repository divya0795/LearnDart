// A FIFO queue implemented with two LIFO stacks. Push goes onto `inbox`.
// When `outbox` is empty, move everything from inbox to outbox, which
// reverses the order so the oldest item is on top. Each element moves at
// most once, so operations are amortised O(1).
class TwoStackQueue<T> {
  final _in = <T>[];
  final _out = <T>[];

  bool get isEmpty => _in.isEmpty && _out.isEmpty;
  int get length => _in.length + _out.length;

  void enqueue(T x) => _in.add(x);

  void _shift() {
    if (_out.isEmpty) {
      while (_in.isNotEmpty) {
        _out.add(_in.removeLast());
      }
    }
  }

  T dequeue() {
    _shift();
    return _out.removeLast();
  }

  T get front {
    _shift();
    return _out.last;
  }
}
