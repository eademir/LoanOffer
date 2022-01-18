class Offer {
  Offer({
    this.annualExpenseRate,
    this.bank,
    this.bankId,
    this.rate,
  });

  double? annualExpenseRate;
  String? bank;
  int? bankId;
  double? rate;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        annualExpenseRate: json["annual_expense_rate"].toDouble(),
        bank: json["bank"],
        bankId: json["bank_id"],
        rate: json["rate"].toDouble(),
      );
}
