// A G-Counter is a CRDT: each replica increments only its own slot, and
// merging takes the per-slot maximum. Replicas converge no matter the
// order or number of merges (merge is commutative, associative and
// idempotent).
class GCounter {
  final String id;
  final Map<String, int> _slots;
  GCounter(this.id, [Map<String, int>? slots]) : _slots = slots ?? {};

  void increment([int by = 1]) => _slots[id] = (_slots[id] ?? 0) + by;

  int get value => _slots.values.fold(0, (a, b) => a + b);

  void merge(GCounter other) {
    for (final e in other._slots.entries) {
      if (e.value > (_slots[e.key] ?? 0)) _slots[e.key] = e.value;
    }
  }
}

class PNCounter {
  final GCounter _p, _n;
  PNCounter(String id) : _p = GCounter(id), _n = GCounter(id);
  void increment() => _p.increment();
  void decrement() => _n.increment();
  int get value => _p.value - _n.value;
  void merge(PNCounter o) {
    _p.merge(o._p);
    _n.merge(o._n);
  }
}

void main() {
  final a = GCounter('a'), b = GCounter('b');
  a.increment(3);
  b.increment(2);
  a.merge(b);
  b.merge(a);
  b.merge(a); // merging again changes nothing
  print('a=${a.value} b=${b.value}');
  final x = PNCounter('x'), y = PNCounter('y');
  x.increment();
  x.increment();
  y.decrement();
  x.merge(y);
  print('pn = ${x.value}');
}
