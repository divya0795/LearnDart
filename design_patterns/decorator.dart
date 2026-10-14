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

abstract class Extra implements Coffee {
  final Coffee inner;
  Extra(this.inner);
}

class Milk extends Extra {
  Milk(super.inner);
  @override
  double get cost => inner.cost + 0.5;
  @override
  String get description => '${inner.description} + milk';
}

class Sugar extends Extra {
  Sugar(super.inner);
  @override
  double get cost => inner.cost + 0.2;
  @override
  String get description => '${inner.description} + sugar';
}

void main() {
  Coffee c = Espresso();
  c = Milk(c);
  c = Sugar(Sugar(c));
  print('${c.description}: \$${c.cost.toStringAsFixed(2)}');
}
