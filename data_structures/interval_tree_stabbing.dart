// Interval stabbing: which stored intervals contain a point? A simple
// approach sorts intervals by start and tracks the maximum end seen so
// far; this version keeps clarity first and checks candidates linearly
// after a binary search on the start.
class Interval {
  final int start, end;
  const Interval(this.start, this.end);
  bool contains(int x) => start <= x && x <= end;
  @override
  String toString() => '[$start,$end]';
}

class IntervalIndex {
  final List<Interval> _sorted;
  IntervalIndex(List<Interval> xs)
    : _sorted = [...xs]..sort((a, b) => a.start.compareTo(b.start));

  List<Interval> stab(int x) {
    var lo = 0, hi = _sorted.length;
    while (lo < hi) {
      final mid = (lo + hi) ~/ 2;
      if (_sorted[mid].start <= x) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return [
      for (var i = 0; i < lo; i++)
        if (_sorted[i].end >= x) _sorted[i],
    ];
  }
}
