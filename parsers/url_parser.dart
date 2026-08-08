// URL parsing by hand: scheme, user info, host, port, path, query and
// fragment, following the structure of RFC 3986.
class ParsedUrl {
  final String scheme, host, path;
  final int? port;
  final String? query, fragment;
  ParsedUrl(
    this.scheme,
    this.host,
    this.port,
    this.path,
    this.query,
    this.fragment,
  );

  @override
  String toString() =>
      'scheme=$scheme host=$host port=$port path=$path query=$query fragment=$fragment';
}

ParsedUrl parseUrl(String url) {
  final m = RegExp(
    r'^([a-zA-Z][a-zA-Z0-9+.-]*)://(?:[^@/]*@)?([^:/?#]+)(?::(\d+))?([^?#]*)(?:\?([^#]*))?(?:#(.*))?$',
  ).firstMatch(url);
  if (m == null) throw FormatException('not a URL: $url');
  return ParsedUrl(
    m[1]!,
    m[2]!,
    m[3] == null ? null : int.parse(m[3]!),
    m[4]!.isEmpty ? '/' : m[4]!,
    m[5],
    m[6],
  );
}
