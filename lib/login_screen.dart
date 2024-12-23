import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        actions: [
          DropdownButton<String>(
            value: Get.locale?.languageCode,
            items: [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'ar', child: Text('العربية')),
            ],
            onChanged: (value) {
              if (value != null) controller.changeLanguage(value);
            },
          ),
          IconButton(
            icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: controller.toggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'username'.tr),
                onSaved: (value) => controller.username.value = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_username'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'.tr),
                obscureText: true,
                onSaved: (value) => controller.password.value = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_password'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.login,
                child: Text('submit'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
