// Matchers describe expectations as values. A matcher is a predicate plus
// a description, so failure messages can say what was wanted.
class Matcher {
  final bool Function(Object?) test;
  final String description;
  const Matcher(this.test, this.description);
}

Matcher equals(Object? x) => Matcher((v) => v == x, 'equals $x');
Matcher greaterThan(num x) =>
    Matcher((v) => v is num && v > x, 'greater than $x');
Matcher isEmptyList = Matcher((v) => v is List && v.isEmpty, 'an empty list');
Matcher contains(Object? x) =>
    Matcher((v) => v is Iterable && v.contains(x), 'contains $x');

Matcher allOf(List<Matcher> ms) => Matcher(
  (v) => ms.every((m) => m.test(v)),
  ms.map((m) => m.description).join(' and '),
);
Matcher anyOf(List<Matcher> ms) => Matcher(
  (v) => ms.any((m) => m.test(v)),
  ms.map((m) => m.description).join(' or '),
);
Matcher not(Matcher m) => Matcher((v) => !m.test(v), 'not ${m.description}');

String? check(Object? actual, Matcher m) =>
    m.test(actual) ? null : 'Expected: ${m.description}\n  Actual: $actual';

void main() {
  print(check(5, greaterThan(3)) ?? 'ok');
  print(check(5, allOf([greaterThan(3), not(equals(5))])) ?? 'ok');
  print(check([1, 2], contains(2)) ?? 'ok');
  print(check([1, 2], anyOf([isEmptyList, contains(9)])) ?? 'ok');
}
