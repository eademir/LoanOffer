import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_offer/controllers/search_page_controller.dart';
import 'package:loan_offer/views/pages/result_page.dart';
import 'package:loan_offer/views/pages/search_page.dart';

class MainPage extends GetView {
  static String id = '/main_page';

  MainPage({Key? key}) : super(key: key);

  final SearchPageX _x = Get.put(SearchPageX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0.0, 2.0),
                    blurRadius: 2.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              child: Obx(
                () => _x.isLoading.isTrue ? SearchPage() : const ResultPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
