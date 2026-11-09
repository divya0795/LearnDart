// A `sync*` function returns an Iterable whose values are produced on
// demand with `yield`. Nothing runs until someone iterates, so infinite
// sequences are fine.
Iterable<int> naturals() sync* {
  var n = 1;
  while (true) {
    yield n++;
  }
}

Iterable<int> fibonacci() sync* {
  var a = 0, b = 1;
  while (true) {
    yield a;
    (a, b) = (b, a + b);
  }
}

Iterable<int> countdownThenUp(int n) sync* {
  yield* [for (var i = n; i > 0; i--) i];
  yield* Iterable.generate(n, (i) => i + 1);
}

Iterable<List<int>> pairs(List<int> xs) sync* {
  for (var i = 0; i < xs.length; i++) {
    for (var j = i + 1; j < xs.length; j++) {
      yield [xs[i], xs[j]];
    }
  }
}

void main() {
  print(naturals().where((n) => n % 7 == 0).take(4).toList());
  print(fibonacci().take(12).toList());
  print(countdownThenUp(3).toList());
  print(pairs([1, 2, 3]).toList());
}
