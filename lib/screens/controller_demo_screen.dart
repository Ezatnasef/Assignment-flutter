import 'package:flutter/material.dart';
import './form_demo_screen.dart';

class ControllerDemoScreen extends StatefulWidget {
  static const routeName = '/controller-demo';

  const ControllerDemoScreen({super.key});

  @override
  State<ControllerDemoScreen> createState() => _ControllerDemoScreenState();
}

class _ControllerDemoScreenState extends State<ControllerDemoScreen> {
  String textVal = "test";

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _updateText() {
    setState(() {
      textVal = myController.text;
    });

    Navigator.of(context).pushReplacementNamed(FormDemoScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar (Screen 1)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                hintText: 'اكتب شيئاً هنا...',
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.green,
              onPressed: _updateText,
              child: const Text(
                'Click (Go to Screen 2)',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              textVal,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}