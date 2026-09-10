// Custom exceptions make failures meaningful. Implement Exception for
// recoverable conditions that callers should handle; use Error for
// programmer mistakes.
class InsufficientFunds implements Exception {
  final double needed;
  InsufficientFunds(this.needed);
  @override
  String toString() =>
      'InsufficientFunds: short by \$${needed.toStringAsFixed(2)}';
}

class Account {
  double _balance;
  Account(this._balance);

  void withdraw(double amount) {
    if (amount <= 0)
      throw ArgumentError.value(amount, 'amount', 'must be positive');
    if (amount > _balance) throw InsufficientFunds(amount - _balance);
    _balance -= amount;
  }

  double get balance => _balance;
}
