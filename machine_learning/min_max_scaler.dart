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
