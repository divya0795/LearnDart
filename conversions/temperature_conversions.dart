// Temperature conversions. Celsius is the hub: every other scale converts
// to Celsius and back. Kelvin below 0 is physically impossible, so reject
// it.
enum Scale { celsius, fahrenheit, kelvin }

double toCelsius(double v, Scale from) => switch (from) {
  Scale.celsius => v,
  Scale.fahrenheit => (v - 32) * 5 / 9,
  Scale.kelvin => v - 273.15,
};

double fromCelsius(double c, Scale to) => switch (to) {
  Scale.celsius => c,
  Scale.fahrenheit => c * 9 / 5 + 32,
  Scale.kelvin => c + 273.15,
};

double convert(double v, Scale from, Scale to) {
  final c = toCelsius(v, from);
  if (c < -273.15) throw ArgumentError('below absolute zero');
  return fromCelsius(c, to);
}

void main() {
  print('100C = ${convert(100, Scale.celsius, Scale.fahrenheit)}F');
  print('0K = ${convert(0, Scale.kelvin, Scale.celsius)}C');
  print('-40F = ${convert(-40, Scale.fahrenheit, Scale.celsius)}C');
  try {
    convert(-1, Scale.kelvin, Scale.celsius);
  } on ArgumentError catch (e) {
    print('error: ${e.message}');
  }
}
