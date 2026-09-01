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
