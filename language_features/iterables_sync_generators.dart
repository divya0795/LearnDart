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
