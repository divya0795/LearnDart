// A sealed class restricts subclasses to the same library, so the compiler
// knows every possible case. A switch over a sealed type must handle them
// all -- forget one and the code does not compile.
sealed class Result<T> {}

class Ok<T> extends Result<T> {
  final T value;
  Ok(this.value);
}

class Err<T> extends Result<T> {
  final String message;
  Err(this.message);
}

String show<T>(Result<T> r) => switch (r) {
  Ok(:final value) => 'ok: $value',
  Err(:final message) => 'error: $message',
};

Result<R> mapResult<T, R>(Result<T> r, R Function(T) f) => switch (r) {
  Ok(:final value) => Ok(f(value)),
  Err(:final message) => Err(message),
};

T unwrapOr<T>(Result<T> r, T fallback) => switch (r) {
  Ok(:final value) => value,
  Err() => fallback,
};
