import 'offer.dart';

Result resultFromJson(Map<String, dynamic> json) => Result.fromJson(json);

class Result {
  Result({
    this.offers,
    this.totalOffers,
    this.errorMessage,
    this.errorCode,
  });

  List<Offer>? offers;
  int? totalOffers;
  String? errorMessage;
  String? errorCode;

  factory Result.fromJson(Map<String, dynamic> json) {
    if (json["offers"] != null) {
      return Result(
        offers: List<Offer>.from(
          json["offers"].map(
            (x) => Offer.fromJson(x),
          ),
        ),
        totalOffers: json["total_offers"],
      );
    } else {
      return Result(
        errorMessage: json["error_message"],
        errorCode: json["error_code"],
      );
    }
  }
}
