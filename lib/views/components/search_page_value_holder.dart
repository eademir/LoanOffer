import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageValueHolder extends GetView {
  const SearchPageValueHolder({
    Key? key,
    required String str,
  })  : _str = str,
        super(key: key);

  final String _str;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: Get.width,
      color: Colors.black12,
      child: Text(
        _str,
        style: Get.textTheme.headline6,
      ),
    );
  }
}
