// Disjoint set union: find(x) returns the representative of x's group;
// union merges two groups. Path compression flattens trees so later finds
// are nearly O(1).
class UnionFind {
  final List<int> _parent, _size;
  int components;

  UnionFind(int n)
    : _parent = List.generate(n, (i) => i),
      _size = List.filled(n, 1),
      components = n;

  int find(int x) {
    while (_parent[x] != x) {
      _parent[x] = _parent[_parent[x]];
      x = _parent[x];
    }
    return x;
  }

  bool union(int a, int b) {
    var ra = find(a), rb = find(b);
    if (ra == rb) return false;
    if (_size[ra] < _size[rb]) {
      final t = ra;
      ra = rb;
      rb = t;
    }
    _parent[rb] = ra;
    _size[ra] += _size[rb];
    components--;
    return true;
  }

  bool connected(int a, int b) => find(a) == find(b);
  int sizeOf(int x) => _size[find(x)];
}

void main() {
  final u = UnionFind(8);
  for (final (a, b) in [(0, 1), (2, 3), (1, 3), (4, 5)]) {
    u.union(a, b);
  }
  print('components: ${u.components}');
  print('0~3: ${u.connected(0, 3)}, 0~4: ${u.connected(0, 4)}');
  print('size of group with 2: ${u.sizeOf(2)}');
  print('redundant union: ${u.union(0, 2)}');
}
