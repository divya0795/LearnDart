// Dart lets classes define operators like +, -, *, == and []. Use it for
// types where the notation is natural, such as vectors and money.
class Vec2 {
  final double x, y;
  const Vec2(this.x, this.y);

  Vec2 operator +(Vec2 o) => Vec2(x + o.x, y + o.y);
  Vec2 operator -(Vec2 o) => Vec2(x - o.x, y - o.y);
  Vec2 operator *(double k) => Vec2(x * k, y * k);
  Vec2 operator -() => Vec2(-x, -y);

  @override
  bool operator ==(Object o) => o is Vec2 && o.x == x && o.y == y;
  @override
  int get hashCode => Object.hash(x, y);

  double operator [](int i) => i == 0 ? x : y;

  @override
  String toString() => 'Vec2($x, $y)';
}

void main() {
  const a = Vec2(1, 2), b = Vec2(3, 4);
  print(a + b);
  print(b - a);
  print(a * 3);
  print(-a);
  print('${a == const Vec2(1, 2)} ${a == b}');
  final dup = Vec2(1, 2);
  print(<Vec2>{a, dup, b}.length);
  print('a[0]=${a[0]} a[1]=${a[1]}');
}
