// Small text-formatting helpers: title case, snake_case, camelCase and URL
// slugs. All start by splitting on anything that is not a letter or digit.
List<String> _words(String s) =>
    RegExp(r'[A-Za-z0-9]+').allMatches(s).map((m) => m[0]!).toList();

String titleCase(String s) =>
    _words(s)
        .map((w) => w[0].toUpperCase() + w.substring(1).toLowerCase())
        .join(' ');

String snakeCase(String s) => _words(s).map((w) => w.toLowerCase()).join('_');

String camelCase(String s) {
  final w = _words(s);
  if (w.isEmpty) return '';
  return w.first.toLowerCase() +
      w
          .skip(1)
          .map((x) => x[0].toUpperCase() + x.substring(1).toLowerCase())
          .join();
}

String slugify(String s) => _words(s).map((w) => w.toLowerCase()).join('-');

void main() {
  const s = 'Hello, wORLD of Dart 3!';
  print(titleCase(s));
  print(snakeCase(s));
  print(camelCase(s));
  print(slugify(s));
}
