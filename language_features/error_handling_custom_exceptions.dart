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

void attempt(Account a, double amount) {
  try {
    a.withdraw(amount);
    print('withdrew $amount, balance ${a.balance}');
  } on InsufficientFunds catch (e) {
    print('declined: $e');
  } on ArgumentError catch (e) {
    print('bad request: ${e.message}');
  } finally {
    print('-- transaction logged');
  }
}

void process(Account a) {
  try {
    a.withdraw(1000);
  } on InsufficientFunds {
    print('cleaning up before propagating');
    rethrow;
  }
}

void main() {
  final a = Account(100);
  attempt(a, 30);
  attempt(a, 500);
  attempt(a, -5);
  try {
    process(a);
  } catch (e) {
    print('caught outside: $e');
  }
}
