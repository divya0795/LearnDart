// Feature scaling: many ML algorithms (k-NN, gradient descent) are
// sensitive to the numeric range of features. Min-max scaling maps each
// column to [0, 1]: (x - min) / (max - min).
class MinMaxScaler {
  late List<double> _min, _max;

  void fit(List<List<double>> rows) {
    final d = rows.first.length;
    _min = List.generate(
      d,
      (j) => rows.map((r) => r[j]).reduce((a, b) => a < b ? a : b),
    );
    _max = List.generate(
      d,
      (j) => rows.map((r) => r[j]).reduce((a, b) => a > b ? a : b),
    );
  }

  List<List<double>> transform(List<List<double>> rows) => [
    for (final r in rows)
      [
        for (var j = 0; j < r.length; j++)
          _max[j] == _min[j] ? 0.0 : (r[j] - _min[j]) / (_max[j] - _min[j]),
      ],
  ];
}

class StandardScaler {
  late List<double> _mean, _std;

  void fit(List<List<double>> rows) {
    final d = rows.first.length, n = rows.length;
    _mean = List.generate(d, (j) => rows.fold(0.0, (s, r) => s + r[j]) / n);
    _std = List.generate(d, (j) {
      final v =
          rows.fold(0.0, (s, r) => s + (r[j] - _mean[j]) * (r[j] - _mean[j])) /
          n;
      return v == 0 ? 1.0 : _sqrt(v);
    });
  }

  List<List<double>> transform(List<List<double>> rows) => [
    for (final r in rows)
      [for (var j = 0; j < r.length; j++) (r[j] - _mean[j]) / _std[j]],
  ];
}

double _sqrt(double v) {
  var x = v;
  for (var i = 0; i < 40; i++) {
    x = (x + v / x) / 2;
  }
  return x;
}
