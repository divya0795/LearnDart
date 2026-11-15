// Extension methods add members to existing types without subclassing or
// editing them. Here we teach String a few helpers.
extension StringX on String {
  String get capitalized =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);
  bool get isPalindrome {
    final s = toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return s == s.split('').reversed.join();
  }
}

extension IterableX<T> on Iterable<T> {
  Iterable<List<T>> chunked(int n) sync* {
    final it = iterator;
    while (true) {
      final chunk = <T>[];
      while (chunk.length < n && it.moveNext()) {
        chunk.add(it.current);
      }
      if (chunk.isEmpty) return;
      yield chunk;
    }
  }

  T? get secondOrNull => length >= 2 ? elementAt(1) : null;
}

extension NumX on num {
  Duration get seconds => Duration(milliseconds: (this * 1000).round());
  num clampTo(num lo, num hi) => this < lo ? lo : (this > hi ? hi : this);
}

void main() {
  print('dart is fun'.capitalized);
  print('A man, a plan, a canal: Panama'.isPalindrome);
  print([1, 2, 3, 4, 5].chunked(2).toList());
  print([7].secondOrNull);
  print(1.5.seconds);
  print(15.clampTo(0, 10));
}
