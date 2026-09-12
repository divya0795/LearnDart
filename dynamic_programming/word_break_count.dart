// Word break (counting): in how many ways can a string be split into
// dictionary words? ways[i] is the number of ways to split the first i
// characters; it is the sum of ways[j] over every j where s[j..i] is a
// word.
int countSegmentations(String s, Set<String> dict) {
  final ways = List.filled(s.length + 1, 0)..[0] = 1;
  for (var i = 1; i <= s.length; i++) {
    for (var j = 0; j < i; j++) {
      if (ways[j] > 0 && dict.contains(s.substring(j, i))) ways[i] += ways[j];
    }
  }
  return ways[s.length];
}

List<String> allSegmentations(String s, Set<String> dict) {
  final memo = <int, List<String>>{};
  List<String> go(int start) {
    if (start == s.length) return [''];
    return memo[start] ??= [
      for (var end = start + 1; end <= s.length; end++)
        if (dict.contains(s.substring(start, end)))
          for (final rest in go(end))
            rest.isEmpty
                ? s.substring(start, end)
                : '${s.substring(start, end)} $rest',
    ];
  }

  return go(0);
}

void main() {
  final dict = {'cat', 'cats', 'and', 'sand', 'dog'};
  print(countSegmentations('catsanddog', dict));
  print(allSegmentations('catsanddog', dict));
  print(countSegmentations('catsandog', dict));
}
