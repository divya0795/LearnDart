// Tokenisation is the first step of most text processing: turn raw text
// into words and sentences. Words are runs of letters, digits and
// apostrophes; sentences end at . ! or ? followed by whitespace.
List<String> words(String text) =>
    RegExp(r"[A-Za-z0-9']+")
        .allMatches(text)
        .map((m) => m[0]!.toLowerCase())
        .toList();

List<String> sentences(String text) => text
    .split(RegExp(r'(?<=[.!?])\s+'))
    .map((s) => s.trim())
    .where((s) => s.isNotEmpty)
    .toList();
