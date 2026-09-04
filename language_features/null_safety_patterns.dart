// Sound null safety: a type like String can never be null; String? may be.
// The null-aware operators handle the optional case concisely.
String greet(String? name) => 'Hello, ${name ?? 'stranger'}!';

int? parseOrNull(String s) => int.tryParse(s);

int lengthOr(String? s, int fallback) {
  if (s == null) return fallback;
  return s.length; // s is promoted to String here
}

void demoOperators(List<int>? maybe) {
  String? cache;
  cache ??= 'computed once';
  print(cache);
  print(maybe?.length);
  print(maybe?[0]);
  final Map<String, int>? m = int.tryParse('1') == null ? null : {'a': 1};
  print(m?['a']);
  final n = parseOrNull('12')!; // asserts non-null; throws if wrong
  print(n + 1);
}
