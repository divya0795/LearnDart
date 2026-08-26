// A small recursive-descent JSON parser.
//
// One method per grammar rule: value -> object | array | string | number |
// true | false | null. Each method consumes input from `_i` and returns a
// Dart value (Map, List, String, num, bool, null). Errors report the
// character offset so mistakes are easy to find.

class JsonParser {
  final String _s;
  int _i = 0;
  JsonParser(this._s);

  static Object? parse(String s) {
    final p = JsonParser(s);
    final v = p._value();
    p._ws();
    if (p._i != s.length) p._fail('trailing characters');
    return v;
  }

  Never _fail(String m) => throw FormatException('$m at offset $_i');

  void _ws() {
    while (_i < _s.length && ' \t\n\r'.contains(_s[_i])) _i++;
  }

  void _expect(String c) {
    if (_i >= _s.length || _s[_i] != c) _fail('expected "$c"');
    _i++;
  }

  Object? _value() {
    _ws();
    if (_i >= _s.length) _fail('unexpected end');
    final c = _s[_i];
    if (c == '{') return _object();
    if (c == '[') return _array();
    if (c == '"') return _string();
    if (_s.startsWith('true', _i)) {
      _i += 4;
      return true;
    }
    if (_s.startsWith('false', _i)) {
      _i += 5;
      return false;
    }
    if (_s.startsWith('null', _i)) {
      _i += 4;
      return null;
    }
    return _number();
  }

  Map<String, Object?> _object() {
    _expect('{');
    final m = <String, Object?>{};
    _ws();
    if (_s[_i] == '}') {
      _i++;
      return m;
    }
    while (true) {
      _ws();
      final k = _string();
      _ws();
      _expect(':');
      m[k] = _value();
      _ws();
      if (_i < _s.length && _s[_i] == ',') {
        _i++;
        continue;
      }
      _expect('}');
      return m;
    }
  }

  List<Object?> _array() {
    _expect('[');
    final a = <Object?>[];
    _ws();
    if (_s[_i] == ']') {
      _i++;
      return a;
    }
    while (true) {
      a.add(_value());
      _ws();
      if (_i < _s.length && _s[_i] == ',') {
        _i++;
        continue;
      }
      _expect(']');
      return a;
    }
  }

  String _string() {
    _expect('"');
    final b = StringBuffer();
    while (_i < _s.length && _s[_i] != '"') {
      if (_s[_i] == '\\') {
        _i++;
        final e = _s[_i++];
        b.write(switch (e) {
          'n' => '\n',
          't' => '\t',
          'r' => '\r',
          'b' => '\b',
          'f' => '\f',
          '/' => '/',
          '\\' => '\\',
          '"' => '"',
          'u' => String.fromCharCode(
            int.parse(_s.substring(_i, _i += 4), radix: 16),
          ),
          _ => _fail('bad escape'),
        });
      } else {
        b.write(_s[_i++]);
      }
    }
    _expect('"');
    return b.toString();
  }

  num _number() {
    final m = RegExp(r'-?\d+(\.\d+)?([eE][+-]?\d+)?').matchAsPrefix(_s, _i);
    if (m == null) _fail('unexpected character');
    _i = m.end;
    return num.parse(m[0]!);
  }
}
