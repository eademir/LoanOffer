import 'package:get/get.dart';
import 'package:loan_offer/models/result.dart';

class Api extends GetConnect {
  Future<Result> postData(int amount, int month) async {
    final response = await post(
      'https://teklifimgelsin.com/api/BriefLoanOffer',
      {'amount': amount * 1000, 'monthly_period': month, 'type': 0, 'n': 3},
    );
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return resultFromJson(response.body);
    }
  }
}
