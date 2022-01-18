import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView {
  const CustomButton({Key? key, required Widget placeHolder, required Function() func})
      : _placeHolder = placeHolder,
        _func = func,
        super(key: key);

  final Widget _placeHolder;
  final Function()? _func;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _func,
      color: Get.theme.primaryColor,
      child: _placeHolder,
    );
  }
}
