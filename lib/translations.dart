import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'login': 'Login',
          'username': 'Username',
          'password': 'Password',
          'enter_username': 'Please enter your username',
          'enter_password': 'Please enter your password',
          'change_theme': 'Change Theme',
          'language': 'Language',
          'submit': 'Submit',
        },
        'ar': {
          'login': 'تسجيل الدخول',
          'username': 'اسم المستخدم',
          'password': 'كلمة المرور',
          'enter_username': 'الرجاء إدخال اسم المستخدم',
          'enter_password': 'الرجاء إدخال كلمة المرور',
          'change_theme': 'تغيير الوضع',
          'language': 'اللغة',
          'submit': 'إرسال',
        },
      };
}
