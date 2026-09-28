// A tiny test framework built from scratch to show how test runners work:
// tests are registered as named closures, each runs in a try/catch, and
// failures are collected and reported at the end.
class TestFailure implements Exception {
  final String message;
  TestFailure(this.message);
  @override
  String toString() => message;
}

final _tests = <(String, void Function())>[];

void test(String name, void Function() body) => _tests.add((name, body));

void expect(Object? actual, Object? expected) {
  if (actual != expected)
    throw TestFailure('expected <$expected> but got <$actual>');
}
