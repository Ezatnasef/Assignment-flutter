import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/about_screen.dart';
import './screens/contact_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ✨ تعريف مجموعة ألوان احترافية
    const primaryColor = Color(0xFF0D253F); 
    const accentColor = Color(0xFF01B4E4); // سماوي مشرق
    const scaffoldBackgroundColor = Color(0xFFF8F9FA); // خلفية رمادي فاتح جداً

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codanweb Professional App',
      // ✨ تطبيق الثيم الجديد
      theme: ThemeData(
        // استخدام ColorScheme لإدارة الألوان بشكل أفضل
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
          centerTitle: true, // مظهر احترافي للـ AppBar
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor, // استخدام اللون المشرق للأزرار
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // حواف دائرية عصرية
            ),
            elevation: 3,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        AboutScreen.routeName: (ctx) => const AboutScreen(),
        ContactScreen.routeName: (ctx) => const ContactScreen(),
      },
    );
  }
}