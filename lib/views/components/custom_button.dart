import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_offer/controllers/search_page_controller.dart';

class CustomButton extends GetView {
  CustomButton({
    Key? key,
  }) : super(key: key);

  final SearchPageX _x = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        _x.fetchData();
      },
      color: Get.theme.primaryColor,
      child: Text(
        'TeklifimGelsin',
        style: Get.textTheme.button,
      ),
    );
  }
}
