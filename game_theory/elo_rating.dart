// Elo rating: each player's rating predicts the chance of winning. The
// expected score of A against B is 1 / (1 + 10^((Rb - Ra) / 400)).
import 'dart:math';

double expectedScore(double ra, double rb) =>
    1 / (1 + pow(10, (rb - ra) / 400));
