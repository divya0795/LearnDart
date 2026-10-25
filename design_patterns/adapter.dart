// Adapter: make an existing class work with code that expects a different
// interface by wrapping it. Here a legacy temperature sensor reporting
// Fahrenheit is adapted to an interface that wants Celsius.
class LegacySensor {
  double readFahrenheit() => 98.6;
}

abstract interface class TemperatureSource {
  double celsius();
}

class SensorAdapter implements TemperatureSource {
  final LegacySensor _s;
  SensorAdapter(this._s);

  @override
  double celsius() => (_s.readFahrenheit() - 32) * 5 / 9;
}
