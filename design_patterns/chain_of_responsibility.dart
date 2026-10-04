// Chain of responsibility: pass a request along a chain until one handler
// deals with it. Middleware pipelines work this way.
typedef Handler = String? Function(String request);

String? authHandler(String r) =>
    r.startsWith('anon:') ? 'denied: login required' : null;
String? rateHandler(String r) =>
    r.contains('spam') ? 'denied: rate limited' : null;
String? appHandler(String r) => 'ok: handled "$r"';

String process(String request, List<Handler> chain) {
  for (final h in chain) {
    final r = h(request);
    if (r != null) return r;
  }
  return 'unhandled';
}
