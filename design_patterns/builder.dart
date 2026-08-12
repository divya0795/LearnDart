// Builder: construct a complex object step by step with a fluent API,
// validating before producing the final immutable result.
class HttpRequest {
  final String method, url;
  final Map<String, String> headers;
  final String? body;
  HttpRequest._(this.method, this.url, this.headers, this.body);

  @override
  String toString() => '$method $url $headers ${body ?? ''}';
}

class RequestBuilder {
  String _method = 'GET';
  String? _url, _body;
  final _headers = <String, String>{};

  RequestBuilder method(String m) {
    _method = m;
    return this;
  }

  RequestBuilder url(String u) {
    _url = u;
    return this;
  }

  RequestBuilder header(String k, String v) {
    _headers[k] = v;
    return this;
  }

  RequestBuilder body(String b) {
    _body = b;
    return this;
  }

  HttpRequest build() {
    if (_url == null) throw StateError('url is required');
    if (_method == 'GET' && _body != null)
      throw StateError('GET cannot have a body');
    return HttpRequest._(_method, _url!, Map.unmodifiable(_headers), _body);
  }
}

void main() {
  print(
    RequestBuilder()
        .url('https://example.com')
        .header('Accept', 'json')
        .build(),
  );
  print(RequestBuilder().method('POST').url('/items').body('{}').build());
  try {
    RequestBuilder().build();
  } on StateError catch (e) {
    print('error: ${e.message}');
  }
}
