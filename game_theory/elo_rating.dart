// Elo rating: each player's rating predicts the chance of winning. The
// expected score of A against B is 1 / (1 + 10^((Rb - Ra) / 400)).
import 'dart:math';

double expectedScore(double ra, double rb) =>
    1 / (1 + pow(10, (rb - ra) / 400));

(double, double) update(double ra, double rb, double scoreA, {double k = 32}) {
  final ea = expectedScore(ra, rb);
  return (ra + k * (scoreA - ea), rb + k * ((1 - scoreA) - (1 - ea)));
}

void main() {
  print(
    '1600 vs 1400 expected: ${expectedScore(1600, 1400).toStringAsFixed(3)}',
  );
  var (a, b) = (1500.0, 1500.0);
  (a, b) = update(a, b, 1);
  print('after A wins: ${a.toStringAsFixed(1)} vs ${b.toStringAsFixed(1)}');
  (a, b) = update(a, b, 0.5);
  print('after a draw: ${a.toStringAsFixed(1)} vs ${b.toStringAsFixed(1)}');
}
