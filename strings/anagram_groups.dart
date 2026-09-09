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
