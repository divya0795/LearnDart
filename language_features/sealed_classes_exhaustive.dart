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
