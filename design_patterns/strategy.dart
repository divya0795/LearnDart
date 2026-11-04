// Strategy: define a family of algorithms and make them interchangeable.
// In Dart a function type is often enough -- no class hierarchy needed.
typedef DiscountStrategy = double Function(double price);

double noDiscount(double p) => p;
double tenPercent(double p) => p * 0.9;
double flatFive(double p) => p > 5 ? p - 5 : 0;

class Checkout {
  DiscountStrategy discount;
  Checkout(this.discount);

  double total(List<double> prices) =>
      prices.fold(0.0, (sum, p) => sum + discount(p));
}
