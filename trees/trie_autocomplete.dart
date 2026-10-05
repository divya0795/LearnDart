// Autocomplete with a trie: each node represents a letter, and a path from
// the root spells a prefix. To suggest completions, walk to the prefix
// node and collect every word below it.
class TrieNode {
  final children = <String, TrieNode>{};
  bool isWord = false;
}

class Trie {
  final root = TrieNode();

  void insert(String w) {
    var n = root;
    for (final c in w.split('')) {
      n = n.children.putIfAbsent(c, () => TrieNode());
    }
    n.isWord = true;
  }

  TrieNode? _find(String prefix) {
    var n = root;
    for (final c in prefix.split('')) {
      final next = n.children[c];
      if (next == null) return null;
      n = next;
    }
    return n;
  }

  bool contains(String w) => _find(w)?.isWord ?? false;

  List<String> complete(String prefix, {int limit = 5}) {
    final start = _find(prefix);
    final out = <String>[];
    void go(TrieNode n, String s) {
      if (out.length >= limit) return;
      if (n.isWord) out.add(s);
      for (final k in (n.children.keys.toList()..sort())) {
        go(n.children[k]!, s + k);
      }
    }

    if (start != null) go(start, prefix);
    return out;
  }
}
