// Dart enums can have fields, constructors and methods, which turns them
// into small typed tables of constants.
enum Planet {
  mercury(3.303e+23, 2.4397e6),
  earth(5.976e+24, 6.37814e6),
  jupiter(1.9e+27, 7.1492e7);

  final double mass, radius;
  const Planet(this.mass, this.radius);

  static const _g = 6.67300E-11;
  double get surfaceGravity => _g * mass / (radius * radius);
  double weightOn(double massKg) => massKg * surfaceGravity;
}
