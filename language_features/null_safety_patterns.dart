// Sound null safety: a type like String can never be null; String? may be.
// The null-aware operators handle the optional case concisely.
String greet(String? name) => 'Hello, ${name ?? 'stranger'}!';

int? parseOrNull(String s) => int.tryParse(s);
