// Orientation of three points: counter-clockwise, clockwise or collinear.
//
// The sign of the 2D cross product (b-a) x (c-a) tells which way you turn
// going a -> b -> c. This tiny primitive underlies convex hulls and
// segment intersection tests.

enum Turn { left, right, straight }

Turn orientation((num, num) a, (num, num) b, (num, num) c) {
  final cross = (b.$1 - a.$1) * (c.$2 - a.$2) - (b.$2 - a.$2) * (c.$1 - a.$1);
  if (cross > 0) return Turn.left;
  if (cross < 0) return Turn.right;
  return Turn.straight;
}

double signedArea2((num, num) a, (num, num) b, (num, num) c) =>
    ((b.$1 - a.$1) * (c.$2 - a.$2) - (b.$2 - a.$2) * (c.$1 - a.$1)).toDouble();
