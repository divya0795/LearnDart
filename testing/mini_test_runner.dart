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

int runAll() {
  var failed = 0;
  for (final (name, body) in _tests) {
    try {
      body();
      print('  ok   $name');
    } on TestFailure catch (e) {
      failed++;
      print('  FAIL $name: $e');
    } catch (e) {
      failed++;
      print('  ERR  $name: $e');
    }
  }
  print('${_tests.length - failed}/${_tests.length} passed');
  return failed;
}
