// A small benchmark helper: warm up, run the function many times and
// report the best and average time. The best run is least affected by
// noise from the operating system.
class Result {
  final Duration best, average;
  Result(this.best, this.average);
  @override
  String toString() =>
      'best ${best.inMicroseconds}us avg ${average.inMicroseconds}us';
}

Result benchmark(void Function() f, {int runs = 20, int warmup = 3}) {
  for (var i = 0; i < warmup; i++) {
    f();
  }
  final times = <Duration>[];
  for (var i = 0; i < runs; i++) {
    final sw = Stopwatch()..start();
    f();
    times.add(sw.elapsed);
  }
  final best = times.reduce((a, b) => a < b ? a : b);
  final avg = Duration(
    microseconds: times.fold(0, (a, d) => a + d.inMicroseconds) ~/ runs,
  );
  return Result(best, avg);
}

void main() {
  print(
    'concat:  ${benchmark(() {
      var s = '';
      for (var i = 0; i < 2000; i++) {
        s += 'x';
      }
      s.length;
    })}',
  );
  print(
    'buffer:  ${benchmark(() {
      final b = StringBuffer();
      for (var i = 0; i < 2000; i++) {
        b.write('x');
      }
      b.toString();
    })}',
  );
}
