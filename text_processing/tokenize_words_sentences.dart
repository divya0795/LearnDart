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

({int words, int sentences, double avgWordLength}) summarize(String text) {
  final w = words(text);
  final total = w.fold(0, (a, b) => a + b.length);
  return (
    words: w.length,
    sentences: sentences(text).length,
    avgWordLength: w.isEmpty ? 0 : total / w.length,
  );
}

void main() {
  const t = "Dart's tokenizer is simple. Is it enough? Yes! Mostly.";
  print(words(t));
  print(sentences(t));
  print(summarize(t));
}
