import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_offer/controllers/languages.dart';
import 'package:loan_offer/views/pages/main_page.dart';
import 'package:loan_offer/views/style/custom_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('tr', 'TR'),
      translations: Languages(),
      getPages: [
        GetPage(
          name: MainPage.id,
          page: () => MainPage(),
        ),
      ],
      theme: CustomTheme().customThemeData,
      home: MainPage(),
    ),
  );
}
