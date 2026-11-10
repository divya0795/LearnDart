// Small text-formatting helpers: title case, snake_case, camelCase and URL
// slugs. All start by splitting on anything that is not a letter or digit.
List<String> _words(String s) =>
    RegExp(r'[A-Za-z0-9]+').allMatches(s).map((m) => m[0]!).toList();

String titleCase(String s) =>
    _words(s)
        .map((w) => w[0].toUpperCase() + w.substring(1).toLowerCase())
        .join(' ');
