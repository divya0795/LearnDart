// Group anagrams: words made from the same letters share a signature, the
// letters sorted alphabetically ("eat" and "tea" both become "aet").
// Use the signature as a map key and collect the words under it.
//
// Complexity: O(n * k log k) for n words of length k.
List<List<String>> groupAnagrams(List<String> words) {
  final groups = <String, List<String>>{};
  for (final w in words) {
    final key = (w.split('')..sort()).join();
    groups.putIfAbsent(key, () => []).add(w);
  }
  return groups.values.toList();
}

/// Same grouping with a 26-slot letter count as the key: O(n * k).
List<List<String>> groupAnagramsByCount(List<String> words) {
  final groups = <String, List<String>>{};
  for (final w in words) {
    final counts = List.filled(26, 0);
    for (final c in w.codeUnits) {
      counts[c - 97]++;
    }
    groups.putIfAbsent(counts.join(','), () => []).add(w);
  }
  return groups.values.toList();
}

/// Start indices in [text] of every anagram of [pattern] (sliding window).
List<int> findAnagrams(String text, String pattern) {
  final out = <int>[];
  if (pattern.length > text.length) return out;
  final need = List.filled(26, 0), have = List.filled(26, 0);
  for (final c in pattern.codeUnits) {
    need[c - 97]++;
  }
  for (var i = 0; i < text.length; i++) {
    have[text.codeUnitAt(i) - 97]++;
    if (i >= pattern.length) have[text.codeUnitAt(i - pattern.length) - 97]--;
    if (i >= pattern.length - 1 && need.join() == have.join()) {
      out.add(i - pattern.length + 1);
    }
  }
  return out;
}

void main() {
  const words = ['eat', 'tea', 'tan', 'ate', 'nat', 'bat'];
  print(groupAnagrams(words));
  print(groupAnagramsByCount(words));
  print(findAnagrams('cbaebabacd', 'abc'));
}
