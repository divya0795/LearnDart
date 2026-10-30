// Retry transient failures with exponentially growing delays. Doubling the
// delay each attempt avoids hammering a struggling service.
import 'dart:math';

Future<T> retry<T>(
  Future<T> Function() action, {
  int maxAttempts = 5,
  Duration base = const Duration(milliseconds: 10),
  void Function(int, Duration)? onRetry,
}) async {
  for (var attempt = 1; ; attempt++) {
    try {
      return await action();
    } catch (e) {
      if (attempt >= maxAttempts) rethrow;
      final delay = base * pow(2, attempt - 1).toInt();
      onRetry?.call(attempt, delay);
      await Future.delayed(delay);
    }
  }
}
