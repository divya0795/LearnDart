// HMAC(key, msg) = H((key ^ opad) || H((key ^ ipad) || msg)). The double
// hashing with two derived keys defeats length-extension attacks that
// break the naive H(key || msg). The hash is passed in as a function, so
// this demo uses a toy 32-bit FNV hash -- NOT secure, only to show the
// construction.
typedef Hash = List<int> Function(List<int>);

List<int> toyHash(List<int> data) {
  var h = 0x811c9dc5;
  for (final b in data) {
    h = ((h ^ b) * 0x01000193) & 0xffffffff;
  }
  return [h >> 24, (h >> 16) & 255, (h >> 8) & 255, h & 255];
}

List<int> hmac(Hash h, List<int> key, List<int> msg, {int block = 64}) {
  var k = key.length > block ? h(key) : key;
  k = [...k, ...List.filled(block - k.length, 0)];
  final ipad = [for (final b in k) b ^ 0x36];
  final opad = [for (final b in k) b ^ 0x5c];
  return h([
    ...opad,
    ...h([...ipad, ...msg]),
  ]);
}
