// Observer: a subject keeps a list of observers and notifies them when its
// state changes, so the subject does not need to know who is listening.
typedef Observer<T> = void Function(T value);

class Subject<T> {
  final _observers = <Observer<T>>[];

  void Function() subscribe(Observer<T> o) {
    _observers.add(o);
    return () => _observers.remove(o);
  }

  void notify(T value) {
    for (final o in List.of(_observers)) {
      o(value);
    }
  }
}

class Thermostat {
  final changes = Subject<double>();
  double _temp = 20;

  set temp(double t) {
    if (t == _temp) return;
    _temp = t;
    changes.notify(t);
  }
}

void main() {
  final t = Thermostat();
  final off = t.changes.subscribe((v) => print('display: $v'));
  t.changes.subscribe((v) {
    if (v > 25) print('alarm: too hot');
  });
  t.temp = 22;
  t.temp = 30;
  off();
  t.temp = 18;
}
