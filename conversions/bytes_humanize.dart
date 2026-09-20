// Human-readable sizes. Two conventions exist: SI (1 kB = 1000 bytes) and
// IEC (1 KiB = 1024 bytes). Divide by the base until the value is under
// the base, then format with one decimal.
String humanBytes(int bytes, {bool si = false}) {
  final base = si ? 1000 : 1024;
  final units = si
      ? ['B', 'kB', 'MB', 'GB', 'TB']
      : ['B', 'KiB', 'MiB', 'GiB', 'TiB'];
  var v = bytes.toDouble(), i = 0;
  while (v >= base && i < units.length - 1) {
    v /= base;
    i++;
  }
  return i == 0 ? '$bytes B' : '${v.toStringAsFixed(1)} ${units[i]}';
}

int parseBytes(String s) {
  final m = RegExp(r'^\s*([\d.]+)\s*([kKMGT]?)(i?)B?\s*$').firstMatch(s);
  if (m == null) throw FormatException('bad size: $s');
  final base = m[3] == 'i' ? 1024 : 1000;
  final exp = m[2]!.isEmpty ? 0 : 'kmgt'.indexOf(m[2]!.toLowerCase()) + 1;
  var mult = 1;
  for (var i = 0; i < exp; i++) {
    mult *= base;
  }
  return (double.parse(m[1]!) * mult).round();
}
