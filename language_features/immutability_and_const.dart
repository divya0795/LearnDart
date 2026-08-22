// const objects are created at compile time and canonicalised: two equal
// const expressions are the same instance. Great for immutable value types.
class Point {
  final int x, y;
  const Point(this.x, this.y);
  Point copyWith({int? x, int? y}) => Point(x ?? this.x, y ?? this.y);

  @override
  bool operator ==(Object o) => o is Point && o.x == x && o.y == y;
  @override
  int get hashCode => Object.hash(x, y);
  @override
  String toString() => 'Point($x, $y)';
}
