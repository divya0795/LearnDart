// Decorator: wrap an object with another that implements the same
// interface and adds behaviour before or after delegating. Decorators can
// be stacked in any order.
abstract interface class Coffee {
  double get cost;
  String get description;
}

class Espresso implements Coffee {
  @override
  double get cost => 2.0;
  @override
  String get description => 'espresso';
}
