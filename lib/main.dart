import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomFormScreen(),
    );
  }
}

class CustomFormScreen extends StatefulWidget {
  @override
  _CustomFormScreenState createState() => _CustomFormScreenState();
}

class _CustomFormScreenState extends State<CustomFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _agreeToTerms = false;

  void _submitForm() {
    if (_formKey.currentState!.validate() && _agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم إرسال النموذج بنجاح!')),
      );
    } else if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يجب الموافقة على الشروط والأحكام.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى تصحيح الأخطاء في النموذج.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نموذج التحقق'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: ClipPath(
            clipper: TopBottomZigZagClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 3,
                    offset: Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'البريد الإلكتروني',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: EmailValidator(
                            errorText: 'يرجى إدخال بريد إلكتروني صحيح'),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _textController,
                        decoration: InputDecoration(
                          labelText: 'النص',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: RequiredValidator(errorText: 'النص مطلوب'),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _numberController,
                        decoration: InputDecoration(
                          labelText: 'رقم',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: PatternValidator(r'^[0-9]+$',
                            errorText: 'يرجى إدخال أرقام فقط'),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'رقم الهاتف اليمني',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: PatternValidator(
                          r'^(9677|96773|96771)[0-9]{6}$',
                          errorText: 'يرجى إدخال رقم هاتف يمني صحيح',
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeToTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreeToTerms = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              'أوافق على الشروط والأحكام',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      CustomButton(
                        label: 'إرسال',
                        color: Colors.green,
                        onPressed: _submitForm,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom clipper for zigzag at top and bottom only
class TopBottomZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double zigzagWidth = 100;
    const double zigzagHeight = 15;
    final path = Path();
    path.moveTo(0, 0);
    for (double i = 0; i < size.width; i += zigzagWidth) {
      path.lineTo(i + zigzagWidth / 2, zigzagHeight);
      path.lineTo(i + zigzagWidth, 0);
    }
    path.lineTo(size.width, size.height - zigzagHeight);
    for (double i = size.width; i > 0; i -= zigzagWidth) {
      path.lineTo(i - zigzagWidth / 2, size.height);
      path.lineTo(i - zigzagWidth, size.height - zigzagHeight);
    }
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
