import 'package:get/get.dart';
import 'package:loan_offer/models/result.dart';
import 'package:loan_offer/services/api.dart';

class SearchPageX extends GetxController {
  RxInt totalValue = 20.obs;
  RxInt range = 3.obs;
  RxBool isLoading = true.obs;
  Rx<Result> result = Result().obs;

  void fetchData() async {
    isLoading(true);
    result.value = await Api().postData(totalValue.value, range.value);
    isLoading(false);
  }
}
