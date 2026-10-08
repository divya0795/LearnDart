// Convert identifiers between camelCase, PascalCase, snake_case and
// kebab-case. First split the identifier into words at underscores,
// hyphens and lower-to-upper transitions (keeping acronyms together).
List<String> splitWords(String s) {
  final spaced = s
      .replaceAllMapped(RegExp(r'([a-z0-9])([A-Z])'), (m) => '${m[1]} ${m[2]}')
      .replaceAllMapped(
        RegExp(r'([A-Z]+)([A-Z][a-z])'),
        (m) => '${m[1]} ${m[2]}',
      );
  return spaced
      .split(RegExp(r'[\s_\-]+'))
      .where((w) => w.isNotEmpty)
      .map((w) => w.toLowerCase())
      .toList();
}

String toSnake(String s) => splitWords(s).join('_');
String toKebab(String s) => splitWords(s).join('-');
String toPascal(String s) =>
    splitWords(s).map((w) => w[0].toUpperCase() + w.substring(1)).join();
String toCamel(String s) {
  final p = toPascal(s);
  return p.isEmpty ? p : p[0].toLowerCase() + p.substring(1);
}
