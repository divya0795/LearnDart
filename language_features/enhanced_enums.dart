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

enum Level implements Comparable<Level> {
  low,
  medium,
  high;

  @override
  int compareTo(Level other) => index - other.index;
  String get label => switch (this) {
    Level.low => 'LOW',
    Level.medium => 'MED',
    Level.high => 'HIGH',
  };
}

void main() {
  for (final p in Planet.values) {
    print(
      '${p.name}: g=${p.surfaceGravity.toStringAsFixed(2)} 70kg -> ${p.weightOn(70).toStringAsFixed(0)} N',
    );
  }
  print(Level.values.map((l) => l.label).toList());
  print(Level.high.compareTo(Level.low));
  print(Level.values.byName('medium'));
}
