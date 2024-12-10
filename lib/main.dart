import 'package:flutter/material.dart';
import 'colors.dart'; // استيراد ملف الألوان

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // استخدام ColorScheme لتعريف الألوان بشكل مخصص
        colorScheme: const ColorScheme(
          brightness: Brightness.light, // يمكن تغييره إلى .dark للإضاءة الداكنة
          primary: Colors.transparent, // لن يتم استخدامه هنا
          onPrimary: Colors.transparent, // لن يتم استخدامه
          secondary: accentColor,
          onSecondary: Colors.white,
          background: backgroundColor,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          error: errorColor,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: backgroundColor,
        buttonTheme: ButtonThemeData(
          buttonColor: buttonColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: textColor),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey, // لون AppBar
          foregroundColor: Colors.white, // لون النص داخل AppBar
        ),
      ),
      home: const MyFormPage(),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  final TextEditingController field3Controller = TextEditingController();
  final TextEditingController field4Controller = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("القيم المدخلة"),
          content: Text(
              "الحقل 1: ${field1Controller.text}\nالحقل 2: ${field2Controller.text}\nالحقل 3: ${field3Controller.text}\nالحقل 4: ${field4Controller.text}"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("حسناً"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    field1Controller.dispose();
    field2Controller.dispose();
    field3Controller.dispose();
    field4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نموذج إدخال'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: field1Controller,
                decoration: InputDecoration(
                  labelText: 'الحقل 1',
                  labelStyle: const TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'يرجى ملء هذا الحقل' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: field2Controller,
                decoration: InputDecoration(
                  labelText: 'الحقل 2',
                  labelStyle: const TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'يرجى ملء هذا الحقل' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: field3Controller,
                decoration: InputDecoration(
                  labelText: 'الحقل 3',
                  labelStyle: const TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'يرجى ملء هذا الحقل' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: field4Controller,
                decoration: InputDecoration(
                  labelText: 'الحقل 4',
                  labelStyle: const TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'يرجى ملء هذا الحقل' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('إرسال'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
