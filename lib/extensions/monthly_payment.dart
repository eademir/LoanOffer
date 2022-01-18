import 'dart:math';

extension MonthlyPayment on int {
  num monthlyPayment(
    int expiry,
    double totalInterestRate,
  ) {
    num monthlyPayment = pow((this * 1000) * totalInterestRate * (1 + totalInterestRate), expiry) /
        pow(1 + totalInterestRate, expiry - 1);
    return monthlyPayment;
  }
}
