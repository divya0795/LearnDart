// Heron's formula: area of a triangle from its three side lengths.
//
// With semi-perimeter s = (a+b+c)/2, area = sqrt(s(s-a)(s-b)(s-c)).
// The sides must satisfy the triangle inequality or the product is
// negative and no triangle exists.
import 'dart:math' as math;

bool isTriangle(double a, double b, double c) =>
    a > 0 && b > 0 && c > 0 && a + b > c && a + c > b && b + c > a;

double heron(double a, double b, double c) {
  if (!isTriangle(a, b, c)) throw ArgumentError('not a triangle');
  final s = (a + b + c) / 2;
  return math.sqrt(s * (s - a) * (s - b) * (s - c));
}

void main() {
  print('3,4,5 -> ${heron(3, 4, 5)}');
  print('equilateral 2 -> ${heron(2, 2, 2)}');
  try {
    heron(1, 2, 3);
  } on ArgumentError catch (e) {
    print('1,2,3 rejected: ${e.message}');
  }
}
