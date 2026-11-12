// A tiny signals library: a Signal holds a value; a Computed re-evaluates
// when anything it read changes. While a computed runs it registers itself
// as the "current" reader, so signals know who depends on them.
Computed? _current;

class Signal<T> {
  T _v;
  final _deps = <Computed>{};
  Signal(this._v);

  T get value {
    if (_current != null) _deps.add(_current!);
    return _v;
  }

  set value(T v) {
    if (v == _v) return;
    _v = v;
    for (final d in _deps.toList()) {
      d.recompute();
    }
  }
}

class Computed {
  final void Function() _fn;
  Computed(this._fn) {
    recompute();
  }

  void recompute() {
    final prev = _current;
    _current = this;
    _fn();
    _current = prev;
  }
}

void main() {
  final price = Signal(10), qty = Signal(2);
  Computed(() => print('total = ${price.value * qty.value}'));
  qty.value = 3;
  price.value = 12;
  price.value = 12; // unchanged: no recompute
}
