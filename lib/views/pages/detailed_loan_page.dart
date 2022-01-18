import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_offer/controllers/search_page_controller.dart';

Future<dynamic> buildShowDialog(
    SearchPageX _, int index, String interestAmount, String total, int fee, BuildContext context) {
  return showDialog(
    builder: (BuildContext context) => AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: const EdgeInsets.all(10.0),
      title: Text(
        'toplammdu'.tr,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('kredi'.tr),
              Text('₺${_.totalValue}.000'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('kreditahsilat'.tr),
              Text('₺$fee'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('faiztut'.tr),
              Text('₺$interestAmount'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('toplam'.tr),
              Text('₺$total'),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('yıllıkmaliyet'.tr),
              Text(
                '%${_.result.value.offers![index].annualExpenseRate!.toStringAsFixed(2)}',
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
    context: context,
  );
}
