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

Future<void> main() async {
  final c = AsyncCache<int, String>((id) async {
    await Future.delayed(const Duration(milliseconds: 20));
    return 'user$id';
  });
  final results = await Future.wait([c.get(1), c.get(1), c.get(2), c.get(1)]);
  print(results);
  print('loads: ${c.loads} (4 requests, 2 distinct keys)');
  c.invalidate(1);
  await c.get(1);
  print('loads after invalidate: ${c.loads}');
}
