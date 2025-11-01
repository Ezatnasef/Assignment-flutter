import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './future_builder_demo_screen.dart';

class HttpDemoScreen extends StatefulWidget {
  static const routeName = '/http-demo';
  const HttpDemoScreen({super.key});

  @override
  State<HttpDemoScreen> createState() => _HttpDemoScreenState();
}

class _HttpDemoScreenState extends State<HttpDemoScreen> {
  String _dataTitle = "Press the button to fetch data";
  bool _isLoading = false;

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _dataTitle = "Loading...";
    });

    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _dataTitle = data['title'];
          _isLoading = false;
        });
        await Future.delayed(const Duration(seconds: 1));
        Navigator.of(context)
            .pushReplacementNamed(FutureBuilderDemoScreen.routeName);
      } else {
        setState(() {
          _dataTitle = "Failed to load data";
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _dataTitle = "An error occurred";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Demo (Screen 4)'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _dataTitle,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: _fetchData,
                  child: const Text('Fetch Data (Go to Screen 5)'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}