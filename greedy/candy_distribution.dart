// Candy: children stand in a line with ratings. Each gets at least one
// candy, and a child with a higher rating than a neighbour must get more
// candy than that neighbour. Minimise total candy.
//
// Two passes: left-to-right enforces the rule against the left neighbour,
// right-to-left enforces it against the right neighbour (taking the max).

int candy(List<int> ratings) {
  final n = ratings.length;
  final c = List.filled(n, 1);
  for (var i = 1; i < n; i++) {
    if (ratings[i] > ratings[i - 1]) c[i] = c[i - 1] + 1;
  }
  for (var i = n - 2; i >= 0; i--) {
    if (ratings[i] > ratings[i + 1] && c[i] <= c[i + 1]) c[i] = c[i + 1] + 1;
  }
  return c.fold(0, (a, b) => a + b);
}

void main() {
  print(candy([1, 0, 2]));
  print(candy([1, 2, 2]));
  print(candy([1, 3, 4, 5, 2]));
}
