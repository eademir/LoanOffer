import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_offer/controllers/search_page_controller.dart';
import 'package:loan_offer/extensions/monthly_payment.dart';

class ResultPage extends GetView<SearchPageX> {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageX>(
      init: SearchPageX(),
      builder: (_) => _.result.value.errorMessage != null
          ? Column(
              children: [
                Text(_.result.value.errorMessage!),
                TextButton(
                  onPressed: () {
                    _.isLoading(true);
                  },
                  child: const Text('back'),
                ),
              ],
            )
          : Column(
              children: [
                Text(
                  'bottom_line'.trParams({
                    'total': _.totalValue.toString(),
                    'range': _.range.toString(),
                  }),
                  style: Get.textTheme.headline6!.copyWith(
                    color: Get.theme.primaryColor,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _.result.value.offers!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Column(
                        children: [
                          Text('${_.result.value.offers![index].bank}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${_.result.value.offers![index].rate}'),
                              Text(_.result.value.offers![index].annualExpenseRate!.toStringAsFixed(2)),
                              Text(
                                '${_.totalValue.value.monthlyPayment(_.range.value, _.result.value.offers![index].rate!).toInt()}',
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  height: 20.0,
                  width: Get.width,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Size özel ${_.result.value.totalOffers} farklı teklif daha var',
                      style: Get.textTheme.bodyText2!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _.isLoading(true);
                  },
                  child: const Text('back'),
                ),
              ],
            ),
    );
  }
}
