import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/about_screen.dart';
import './screens/contact_screen.dart';
import './screens/login_screen.dart';
import './screens/controller_demo_screen.dart';
import './screens/form_demo_screen.dart';
import './screens/async_demo_screen.dart';
import './screens/http_demo_screen.dart';
import './screens/future_builder_demo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0D253F);
    const accentColor = Color(0xFF01B4E4);
    const scaffoldBackgroundColor = Color(0xFFF8F9FA);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codanweb Professional App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: accentColor,
          background: scaffoldBackgroundColor,
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 3,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      initialRoute: ControllerDemoScreen.routeName,
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        AboutScreen.routeName: (ctx) => const AboutScreen(),
        ContactScreen.routeName: (ctx) => const ContactScreen(),
        ControllerDemoScreen.routeName: (ctx) => const ControllerDemoScreen(),
        FormDemoScreen.routeName: (ctx) => const FormDemoScreen(),
        AsyncDemoScreen.routeName: (ctx) => const AsyncDemoScreen(),
        HttpDemoScreen.routeName: (ctx) => const HttpDemoScreen(),
        FutureBuilderDemoScreen.routeName: (ctx) =>
            const FutureBuilderDemoScreen(),
      },
    );
  }
}