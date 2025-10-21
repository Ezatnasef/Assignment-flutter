import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'contact_screen.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeColors = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  themeColors.surface,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: <Widget>[
                const SizedBox(height: 60),
                Icon(
                  Icons.business_center_outlined,
                  size: 80,
                  color: themeColors.primary.withOpacity(0.8),
                ),
                const SizedBox(height: 16),
                Text(
                  'About Our Mission',
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'We are dedicated to crafting high-quality, scalable, and beautiful applications using Flutter. Our mission is to provide seamless user experiences through clean code and modern design.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  label: const Text('Get In Touch'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ContactScreen.routeName);
                  },
                ),
              ],
            ),
          ),

          // ✅ زر المينيو الثابت
          Positioned(
            top: 40,
            left: 16,
            child: Builder(
              builder: (context) => GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: themeColors.primary.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
