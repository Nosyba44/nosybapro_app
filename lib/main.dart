import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'translations.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslations(), // إضافة الترجمة
      locale: Locale('en'), // اللغة الافتراضية
      fallbackLocale: Locale('en'), // لغة احتياطية
      theme: ThemeData.light(), // الوضع المضيء
      darkTheme: ThemeData.dark(), // الوضع المعتم
      themeMode: ThemeMode.system, // الوضع الافتراضي حسب النظام
      home: LoginScreen(),
    );
  }
}
