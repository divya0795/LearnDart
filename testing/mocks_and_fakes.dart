// Test doubles replace real dependencies. A fake clock lets tests control
// time instead of waiting for it.
abstract interface class Clock {
  DateTime now();
}

class SystemClock implements Clock {
  @override
  DateTime now() => DateTime.now();
}

class FakeClock implements Clock {
  DateTime _t;
  FakeClock(this._t);
  void advance(Duration d) => _t = _t.add(d);
  @override
  DateTime now() => _t;
}
