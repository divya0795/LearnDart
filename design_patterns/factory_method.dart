// Factory method: let a creator decide which concrete class to build so
// callers depend only on an interface. Here shapes are created from a
// name without the caller knowing the concrete types.
abstract interface class Shape {
  double get area;
  String get name;
}

class Circle implements Shape {
  final double r;
  Circle(this.r);
  @override
  double get area => 3.141592653589793 * r * r;
  @override
  String get name => 'circle';
}

class Square implements Shape {
  final double s;
  Square(this.s);
  @override
  double get area => s * s;
  @override
  String get name => 'square';
}

Shape makeShape(String kind, double size) => switch (kind) {
  'circle' => Circle(size),
  'square' => Square(size),
  _ => throw ArgumentError('unknown shape $kind'),
};
