// A URL shortener's core: map an auto-incrementing id to a short code
// using base 62 (0-9, a-z, A-Z), so 62^6 = 56 billion links fit in six
// characters.
const _alphabet =
    '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

String encode62(int id) {
  if (id == 0) return '0';
  final out = <String>[];
  while (id > 0) {
    out.add(_alphabet[id % 62]);
    id ~/= 62;
  }
  return out.reversed.join();
}

int decode62(String s) =>
    s.split('').fold(0, (n, c) => n * 62 + _alphabet.indexOf(c));

class Shortener {
  final _byCode = <String, String>{};
  final _byUrl = <String, String>{};
  var _next = 1000;

  String shorten(String url) => _byUrl.putIfAbsent(url, () {
    final code = encode62(_next++);
    _byCode[code] = url;
    return code;
  });

  String? resolve(String code) => _byCode[code];
}
