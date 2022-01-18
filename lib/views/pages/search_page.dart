import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_offer/controllers/search_page_controller.dart';
import 'package:loan_offer/views/components/custom_button.dart';
import 'package:loan_offer/views/components/custom_slider.dart';
import 'package:loan_offer/views/components/search_page_value_holder.dart';

class SearchPage extends GetView {
  SearchPage({Key? key}) : super(key: key);

  final SearchPageX _x = Get.put(SearchPageX());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'title'.tr,
          style: Get.textTheme.headline4,
        ),
        const SizedBox(
          height: 60.0,
        ),
        Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: Get.width,
                child: Text('total'.tr),
              ),
              Obx(() => SearchPageValueHolder(
                    str: '₺${_x.totalValue}.000',
                  )),
              Obx(
                () => CustomSlider(
                  val: _x.totalValue.value.toDouble(),
                  min: 1.0,
                  max: 100.0,
                  func: (value) {
                    _x.totalValue.value = value.round();
                  },
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: Get.width,
                child: Text('range'.tr),
              ),
              Obx(
                () => SearchPageValueHolder(
                  str: '${_x.range} Ay',
                ),
              ),
              Obx(() => CustomSlider(
                  min: 3.0,
                  max: 36.0,
                  func: (value) {
                    _x.range.value = value.round();
                  },
                  val: _x.range.value.toDouble())),
            ],
          ),
        ),
        Center(
          child: Obx(
            () => Text(
              'bottom_line'.trParams({
                'total': _x.totalValue.toString(),
                'range': _x.range.toString(),
              }),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Center(
          child: CustomButton(
            placeHolder: Text(
              'TeklifimGelsin',
              style: Get.textTheme.button,
            ),
            func: () {
              _x.fetchData();
            },
          ),
        )
      ],
    );
  }
}
