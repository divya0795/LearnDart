// A tiny Markdown-to-HTML converter: headings (#), bullet lists (- ),
// paragraphs, and inline **bold**, *italic* and `code`. It escapes HTML
// first so the input cannot inject markup.
String escape(String s) =>
    s.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;');

String inline(String s) => escape(s)
    .replaceAllMapped(
      RegExp(r'\*\*(.+?)\*\*'),
      (m) => '<strong>${m[1]}</strong>',
    )
    .replaceAllMapped(RegExp(r'\*(.+?)\*'), (m) => '<em>${m[1]}</em>')
    .replaceAllMapped(RegExp(r'`(.+?)`'), (m) => '<code>${m[1]}</code>');

String toHtml(String md) {
  final out = <String>[];
  var inList = false;
  for (final line in md.split('\n')) {
    final h = RegExp(r'^(#{1,6})\s+(.*)$').firstMatch(line);
    final li = RegExp(r'^[-*]\s+(.*)$').firstMatch(line);
    if (!(li != null) && inList) {
      out.add('</ul>');
      inList = false;
    }
    if (h != null) {
      out.add('<h${h[1]!.length}>${inline(h[2]!)}</h${h[1]!.length}>');
    } else if (li != null) {
      if (!inList) out.add('<ul>');
      inList = true;
      out.add('<li>${inline(li[1]!)}</li>');
    } else if (line.trim().isNotEmpty) {
      out.add('<p>${inline(line)}</p>');
    }
  }
  if (inList) out.add('</ul>');
  return out.join('\n');
}
