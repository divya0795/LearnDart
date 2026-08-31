// Do two line segments intersect?
//
// Segments p1p2 and p3p4 cross when p3 and p4 are on opposite sides of
// line p1p2 AND p1 and p2 are on opposite sides of line p3p4. Collinear
// touching cases need an extra bounding-box check.
typedef P = (double, double);
