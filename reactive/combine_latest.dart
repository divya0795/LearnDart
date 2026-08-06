// combineLatest: emit a combined value whenever ANY source emits, using the
// most recent value from each. Nothing is emitted until every source has
// produced at least one value.
class Source<T> {
  final _listeners = <void Function(T)>[];
  void emit(T v) {
    for (final l in List.of(_listeners)) {
      l(v);
    }
  }

  void listen(void Function(T) l) => _listeners.add(l);
}

Source<R> combineLatest<A, B, R>(Source<A> a, Source<B> b, R Function(A, B) f) {
  final out = Source<R>();
  A? la;
  B? lb;
  var ha = false, hb = false;
  void fire() {
    if (ha && hb) out.emit(f(la as A, lb as B));
  }

  a.listen((v) {
    la = v;
    ha = true;
    fire();
  });
  b.listen((v) {
    lb = v;
    hb = true;
    fire();
  });
  return out;
}
