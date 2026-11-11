// Singleton: exactly one instance of a class, shared everywhere. In Dart a
// factory constructor can return the same cached object each time, so
// callers just write `Config()`.
class Config {
  static final Config _instance = Config._internal();
  final Map<String, String> _values = {};

  factory Config() => _instance;
  Config._internal();

  void set(String k, String v) => _values[k] = v;
  String? get(String k) => _values[k];
}
