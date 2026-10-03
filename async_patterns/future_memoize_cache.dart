// Memoising async functions: store the Future itself (not just the result)
// so concurrent callers for the same key share one in-flight computation
// instead of starting duplicates.
class AsyncCache<K, V> {
  final Future<V> Function(K) _load;
  final _cache = <K, Future<V>>{};
  int loads = 0;
  AsyncCache(this._load);

  Future<V> get(K key) => _cache.putIfAbsent(key, () {
    loads++;
    return _load(key);
  });

  void invalidate(K key) => _cache.remove(key);
}
