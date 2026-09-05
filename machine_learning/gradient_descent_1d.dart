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
