// Do two line segments intersect?
//
// Segments p1p2 and p3p4 cross when p3 and p4 are on opposite sides of
// line p1p2 AND p1 and p2 are on opposite sides of line p3p4. Collinear
// touching cases need an extra bounding-box check.
typedef P = (double, double);

int _orient(P a, P b, P c) {
  final v = (b.$1 - a.$1) * (c.$2 - a.$2) - (b.$2 - a.$2) * (c.$1 - a.$1);
  return v > 0 ? 1 : (v < 0 ? -1 : 0);
}

bool _onSegment(P a, P b, P p) =>
    p.$1 >= (a.$1 < b.$1 ? a.$1 : b.$1) &&
    p.$1 <= (a.$1 > b.$1 ? a.$1 : b.$1) &&
    p.$2 >= (a.$2 < b.$2 ? a.$2 : b.$2) &&
    p.$2 <= (a.$2 > b.$2 ? a.$2 : b.$2);

bool segmentsIntersect(P p1, P p2, P p3, P p4) {
  final o1 = _orient(p1, p2, p3), o2 = _orient(p1, p2, p4);
  final o3 = _orient(p3, p4, p1), o4 = _orient(p3, p4, p2);
  if (o1 != o2 && o3 != o4) return true;
  if (o1 == 0 && _onSegment(p1, p2, p3)) return true;
  if (o2 == 0 && _onSegment(p1, p2, p4)) return true;
  if (o3 == 0 && _onSegment(p3, p4, p1)) return true;
  if (o4 == 0 && _onSegment(p3, p4, p2)) return true;
  return false;
}

void main() {
  print('cross:    ${segmentsIntersect((0, 0), (4, 4), (0, 4), (4, 0))}');
  print('parallel: ${segmentsIntersect((0, 0), (4, 0), (0, 1), (4, 1))}');
  print('touching: ${segmentsIntersect((0, 0), (2, 2), (2, 2), (4, 0))}');
  print(
    'collinear overlap: ${segmentsIntersect((0, 0), (3, 0), (2, 0), (5, 0))}',
  );
}
