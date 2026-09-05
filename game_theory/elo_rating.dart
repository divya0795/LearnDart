// Elo rating: each player's rating predicts the chance of winning. The
// expected score of A against B is 1 / (1 + 10^((Rb - Ra) / 400)).
import 'dart:math';

double expectedScore(double ra, double rb) =>
    1 / (1 + pow(10, (rb - ra) / 400));

(double, double) update(double ra, double rb, double scoreA, {double k = 32}) {
  final ea = expectedScore(ra, rb);
  return (ra + k * (scoreA - ea), rb + k * ((1 - scoreA) - (1 - ea)));
}
