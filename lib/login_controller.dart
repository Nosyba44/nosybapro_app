import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // يمكن إضافة منطق تسجيل الدخول هنا (API أو قاعدة بيانات)
      Get.snackbar('Success', 'Logged in as $username',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void changeLanguage(String lang) {
    Get.updateLocale(Locale(lang));
  }

  void toggleTheme() {
    Get.isDarkMode
        ? Get.changeThemeMode(ThemeMode.light)
        : Get.changeThemeMode(ThemeMode.dark);
  }
}
