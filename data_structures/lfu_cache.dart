// LFU cache: when full, evict the key used the fewest times (ties broken
// by least recently used). This version favours clarity over O(1)
// eviction: it keeps a use counter and a logical clock per key and scans
// for the victim, O(n) on eviction.
class LfuCache<K, V> {
  final int capacity;
  final _data = <K, V>{};
  final _freq = <K, int>{};
  final _lastUsed = <K, int>{};
  var _clock = 0;

  LfuCache(this.capacity);

  V? get(K k) {
    if (!_data.containsKey(k)) return null;
    _touch(k);
    return _data[k];
  }

  void _touch(K k) {
    _freq[k] = (_freq[k] ?? 0) + 1;
    _lastUsed[k] = _clock++;
  }

  void put(K k, V v) {
    if (capacity == 0) return;
    if (!_data.containsKey(k) && _data.length >= capacity) _evict();
    _data[k] = v;
    _touch(k);
  }

  void _evict() {
    K? victim;
    for (final k in _data.keys) {
      if (victim == null ||
          _freq[k]! < _freq[victim]! ||
          (_freq[k] == _freq[victim] && _lastUsed[k]! < _lastUsed[victim]!)) {
        victim = k;
      }
    }
    _data.remove(victim);
    _freq.remove(victim);
    _lastUsed.remove(victim);
  }
}
