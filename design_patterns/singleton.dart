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

class Lazy {
  static Lazy? _i;
  static int created = 0;
  Lazy._() {
    created++;
  }
  static Lazy get instance => _i ??= Lazy._();
}

void main() {
  Config().set('theme', 'dark');
  print('same object: ${identical(Config(), Config())}');
  print('shared state: ${Config().get('theme')}');
  Lazy.instance;
  Lazy.instance;
  print('lazy created ${Lazy.created} time(s)');
}
