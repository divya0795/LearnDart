// Gradient descent in one dimension: repeatedly step opposite to the
// derivative, scaled by a learning rate. For f(x) = (x - 3)^2 the
// minimum is at x = 3.
double descend(
  double Function(double) grad,
  double start, {
  double lr = 0.1,
  int steps = 100,
}) {
  var x = start;
  for (var i = 0; i < steps; i++) {
    x -= lr * grad(x);
  }
  return x;
}

void demoLearningRates() {
  double grad(double x) => 2 * (x - 3);
  for (final lr in [0.01, 0.1, 0.9, 1.1]) {
    final x = descend(grad, 0, lr: lr, steps: 50);
    print('lr=$lr -> x=${x.toStringAsFixed(4)}');
  }
}

void main() => demoLearningRates();
