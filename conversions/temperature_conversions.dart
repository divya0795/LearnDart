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
