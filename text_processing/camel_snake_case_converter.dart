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
