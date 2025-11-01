import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './login_screen.dart';

class FutureBuilderDemoScreen extends StatefulWidget {
  static const routeName = '/future-builder-demo';
  const FutureBuilderDemoScreen({super.key});

  @override
  State<FutureBuilderDemoScreen> createState() =>
      _FutureBuilderDemoScreenState();
}

class _FutureBuilderDemoScreenState extends State<FutureBuilderDemoScreen> {
  Future<List<dynamic>> _getData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder Demo (Screen 5)'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _getData(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (listCtx, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${data[index]["id"]}')),
                    title: Text(data[index]['title'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Text(data[index]['body'],
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No data found.'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        },
        tooltip: 'Go to Login',
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}