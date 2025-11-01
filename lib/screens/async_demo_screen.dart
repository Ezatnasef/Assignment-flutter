import 'package:flutter/material.dart';
import './http_demo_screen.dart';

class AsyncDemoScreen extends StatefulWidget {
  static const routeName = '/async-demo';
  const AsyncDemoScreen({super.key});

  @override
  State<AsyncDemoScreen> createState() => _AsyncDemoScreenState();
}

class _AsyncDemoScreenState extends State<AsyncDemoScreen> {
  String _data = "Press the button to fetch data";
  bool _isLoading = false;

  Future<void> _getData() async {
    setState(() {
      _data = "Fetching data...";
      _isLoading = true;
    });

    print("...Step 1: Starting data fetch");

    String result = await Future.delayed(const Duration(seconds: 4), () {
      print("...Step 2: Data arrived (after 4 seconds)");
      return "\$99 (Price fetched)";
    });

    print("...Step 3: Displaying data on screen");

    setState(() {
      _data = result;
      _isLoading = false;
    });

    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed(HttpDemoScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async/Await Demo (Screen 3)'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _data,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: _getData,
                  child: const Text('Fetch Data (Go to Screen 4)'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}