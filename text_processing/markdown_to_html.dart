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
