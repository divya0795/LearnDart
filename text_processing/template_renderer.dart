// A minimal template engine: replace {{name}} with values from a map,
// escaping HTML by default and supporting {{{raw}}} for trusted markup
// and dotted paths like {{user.name}}.
String _escape(String s) => s
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;');

Object? _lookup(Map<String, Object?> ctx, String path) {
  Object? cur = ctx;
  for (final part in path.trim().split('.')) {
    if (cur is Map && cur.containsKey(part)) {
      cur = cur[part];
    } else {
      return null;
    }
  }
  return cur;
}

String render(String template, Map<String, Object?> ctx) => template
    .replaceAllMapped(
      RegExp(r'\{\{\{(.+?)\}\}\}'),
      (m) => '${_lookup(ctx, m[1]!) ?? ''}',
    )
    .replaceAllMapped(
      RegExp(r'\{\{(.+?)\}\}'),
      (m) => _escape('${_lookup(ctx, m[1]!) ?? ''}'),
    );

void main() {
  const t =
      'Hello {{user.name}}! Bio: {{bio}} | raw: {{{bio}}} | missing: [{{nope}}]';
  print(
    render(t, {
      'user': {'name': 'Ada'},
      'bio': '<b>pioneer</b>',
    }),
  );
}
