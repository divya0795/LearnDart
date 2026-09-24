// Ring buffer: a fixed-size queue that overwrites the oldest element when
// full. Perfect for "last N events" logs. Two indices wrap around a
// backing list.
class RingBuffer<T> {
  final List<T?> _data;
  int _start = 0, _length = 0;
  RingBuffer(int capacity) : _data = List.filled(capacity, null);

  int get length => _length;
  int get capacity => _data.length;
  bool get isFull => _length == capacity;

  void add(T x) {
    if (isFull) {
      _data[_start] = x;
      _start = (_start + 1) % capacity;
    } else {
      _data[(_start + _length) % capacity] = x;
      _length++;
    }
  }

  T operator [](int i) {
    if (i < 0 || i >= _length) throw RangeError.index(i, this);
    return _data[(_start + i) % capacity] as T;
  }

  List<T> toList() => [for (var i = 0; i < _length; i++) this[i]];
}

void main() {
  final b = RingBuffer<int>(3);
  for (var i = 1; i <= 5; i++) {
    b.add(i);
    print('after $i: ${b.toList()}');
  }
}
