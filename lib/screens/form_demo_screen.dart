import 'package:flutter/material.dart';
import './async_demo_screen.dart';

class FormDemoScreen extends StatefulWidget {
  static const routeName = '/form-demo';
  const FormDemoScreen({super.key});

  @override
  State<FormDemoScreen> createState() => _FormDemoScreenState();
}

class _FormDemoScreenState extends State<FormDemoScreen> {
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    Navigator.of(context).pushReplacementNamed(AsyncDemoScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation (Screen 2)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'اكتب اسم المستخدم',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'هذا الحقل مطلوب (Not Valid)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'يجب أن تكون 6 أحرف على الأقل',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'كلمة المرور قصيرة جداً (Not Valid)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: _submitForm,
                  child: const Text('Validate (Go to Screen 3)'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}