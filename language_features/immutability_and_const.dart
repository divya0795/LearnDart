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

void demoCollections() {
  final mutable = [1, 2, 3]; // the variable is final, the list is not
  mutable.add(4);
  const frozen = [1, 2, 3];
  try {
    frozen.add(4);
  } on UnsupportedError {
    print('const list cannot change');
  }
  final unmod = List.unmodifiable(mutable);
  print('${mutable.length} ${unmod.length}');
}

void main() {
  const a = Point(1, 2), b = Point(1, 2);
  print('identical: ${identical(a, b)}');
  print(a.copyWith(y: 9));
  demoCollections();
}
