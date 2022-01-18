import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends GetView {
  const CustomSlider({Key? key, required min, required max, required func, required val})
      : _min = min,
        _max = max,
        _val = val,
        _func = func,
        super(key: key);

  final double _min;
  final double _max;
  final double _val;
  final Function _func;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 9.0,
      ),
      child: Slider(
        thumbColor: Get.theme.primaryColor,
        activeColor: Get.theme.primaryColor,
        inactiveColor: Colors.white,
        max: _max,
        min: _min,
        divisions: 100,
        onChanged: (value) {
          _func(value);
        },
        value: _val,
      ),
    );
  }
}
