import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_offer/controllers/search_page_controller.dart';
import 'package:loan_offer/extensions/total_interest_rate.dart';
import 'package:loan_offer/views/components/custom_button.dart';
import 'package:loan_offer/views/pages/detailed_loan_page.dart';

class ResultPage extends GetView<SearchPageX> {
  const ResultPage({Key? key}) : super(key: key);

  final int fee = 150;

  int monthlyPayment({
    required int amount,
    required double totalInterestRate,
    required int expiry,
  }) {
    double monthlyPayment = (amount * totalInterestRate * pow(1 + totalInterestRate, expiry)) /
        (pow(1 + totalInterestRate, expiry) - 1);
    return monthlyPayment.toInt();
  }

  double interestAmount({
    required double rate,
    required int amount,
    required int time,
  }) {
    double interestAmount = ((amount * rate * time) / 1200) / 2;
    return interestAmount;
  }

  double totalPayment({
    required int amount,
    required int fee,
    required double interestAmount,
  }) {
    double totalPayment = amount + fee + interestAmount;
    return totalPayment;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageX>(
      init: SearchPageX(),
      builder: (_) => _.result.value.errorMessage != null
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _.result.value.errorMessage!,
                    style: Get.textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        placeHolder: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        func: () {
                          _.isLoading(true);
                        },
                      ),
                    ],
                  ),
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
                const SizedBox(
                  height: 20.0,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _.result.value.offers!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        onTap: () => buildShowDialog(
                          _,
                          index,
                          interestAmount(
                            amount: _.totalValue.value * 1000,
                            rate: _.result.value.offers![index].annualExpenseRate!,
                            time: _.range.value,
                          ).toStringAsFixed(3),
                          totalPayment(
                            amount: _.totalValue.value * 1000,
                            fee: fee,
                            interestAmount: interestAmount(
                              amount: _.totalValue.value * 1000,
                              rate: _.result.value.offers![index].annualExpenseRate!,
                              time: _.range.value,
                            ),
                          ).toInt().toString(),
                          fee,
                          context,
                        ),
                        title: Column(
                          children: [
                            Text(
                              '${_.result.value.offers![index].bank}',
                              style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('oran'.tr),
                                    Text(
                                      '%${_.result.value.offers![index].rate}',
                                      style: Get.textTheme.headline5,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('maliyet'.tr),
                                    Text(
                                      '₺${totalPayment(
                                        amount: _.totalValue.value * 1000,
                                        fee: fee,
                                        interestAmount: interestAmount(
                                          amount: _.totalValue.value * 1000,
                                          rate: _.result.value.offers![index].annualExpenseRate!,
                                          time: _.range.value,
                                        ),
                                      ).toInt()}',
                                      style: Get.textTheme.headline5,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('aylik_taksit'.tr),
                                    Text(
                                      '₺${monthlyPayment(
                                        amount: _.totalValue.value * 1000,
                                        totalInterestRate: _.result.value.offers![index].rate!
                                            .totalInterestRate(), //extension
                                        expiry: _.range.value,
                                      )}',
                                      style: Get.textTheme.headline5!.copyWith(
                                          color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  height: 20.0,
                  width: Get.width,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Size özel ${_.result.value.totalOffers} farklı teklif daha var',
                        style: Get.textTheme.bodyText2!.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        placeHolder: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        func: () {
                          _.isLoading(true);
                        },
                      ),
                      CustomButton(
                        placeHolder: Text('Devam Et'.tr, style: Get.textTheme.button),
                        func: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
