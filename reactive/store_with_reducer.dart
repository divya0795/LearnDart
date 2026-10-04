// A Redux-style store: state changes only by dispatching actions to a
// pure reducer, and subscribers are notified after each change. Pure
// reducers make state transitions easy to test and replay.
typedef Reducer<S, A> = S Function(S state, A action);

class Store<S, A> {
  S _state;
  final Reducer<S, A> _reducer;
  final _subs = <void Function(S)>[];
  Store(this._state, this._reducer);

  S get state => _state;

  void dispatch(A action) {
    _state = _reducer(_state, action);
    for (final s in List.of(_subs)) {
      s(_state);
    }
  }

  void Function() subscribe(void Function(S) s) {
    _subs.add(s);
    return () => _subs.remove(s);
  }
}
