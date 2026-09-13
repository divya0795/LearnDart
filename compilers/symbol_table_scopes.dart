// Symbol tables map names to declarations. Languages with block scope use
// a stack of tables: entering a block pushes one, leaving pops it, and
// lookups search from the innermost scope outward so inner declarations
// shadow outer ones.
class SymbolTable {
  final _scopes = <Map<String, String>>[{}];

  void enter() => _scopes.add({});
  void leave() => _scopes.removeLast();

  bool declare(String name, String type) {
    if (_scopes.last.containsKey(name))
      return false; // redeclared in same scope
    _scopes.last[name] = type;
    return true;
  }

  String? lookup(String name) {
    for (final s in _scopes.reversed) {
      if (s.containsKey(name)) return s[name];
    }
    return null;
  }

  int get depth => _scopes.length;
}

void main() {
  final t = SymbolTable();
  t.declare('x', 'int');
  t.enter();
  t.declare('x', 'String');
  print('inner x: ${t.lookup('x')}');
  print('redeclare in same scope: ${t.declare('x', 'bool')}');
  t.leave();
  print('outer x: ${t.lookup('x')}, y: ${t.lookup('y')}');
}
