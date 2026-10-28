// Do two axis-aligned rectangles overlap, and by how much?
//
// They are disjoint exactly when one lies entirely to one side of the
// other on either axis. Otherwise the overlap is the intersection of the
// x-intervals times the intersection of the y-intervals.

class Rect {
  final double x1, y1, x2, y2; // bottom-left and top-right
  const Rect(this.x1, this.y1, this.x2, this.y2);
  double get area => (x2 - x1) * (y2 - y1);
}

bool overlaps(Rect a, Rect b) =>
    a.x1 < b.x2 && b.x1 < a.x2 && a.y1 < b.y2 && b.y1 < a.y2;

double overlapArea(Rect a, Rect b) {
  if (!overlaps(a, b)) return 0;
  final w = (a.x2 < b.x2 ? a.x2 : b.x2) - (a.x1 > b.x1 ? a.x1 : b.x1);
  final h = (a.y2 < b.y2 ? a.y2 : b.y2) - (a.y1 > b.y1 ? a.y1 : b.y1);
  return w * h;
}
