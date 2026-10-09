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
