// Predicates on square matrices: identity, diagonal, symmetric and upper
// triangular. Each is a simple loop over the cells that must obey a rule.
bool isIdentity(List<List<num>> m) => [
  for (var i = 0; i < m.length; i++)
    for (var j = 0; j < m.length; j++) m[i][j] == (i == j ? 1 : 0),
].every((b) => b);

bool isDiagonal(List<List<num>> m) => [
  for (var i = 0; i < m.length; i++)
    for (var j = 0; j < m.length; j++) i == j || m[i][j] == 0,
].every((b) => b);

bool isSymmetric(List<List<num>> m) => [
  for (var i = 0; i < m.length; i++)
    for (var j = i + 1; j < m.length; j++) m[i][j] == m[j][i],
].every((b) => b);

bool isUpperTriangular(List<List<num>> m) => [
  for (var i = 1; i < m.length; i++)
    for (var j = 0; j < i; j++) m[i][j] == 0,
].every((b) => b);
