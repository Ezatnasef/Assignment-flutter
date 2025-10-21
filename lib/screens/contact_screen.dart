import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contact';

  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.fromLTRB(16, 80, 16, 24),
              children: <Widget>[
                _buildContactCard(
                  context: context,
                  icon: Icons.alternate_email,
                  title: 'Email Us',
                  subtitle: 'ezatyahta@gmail.com',
                ),
                _buildContactCard(
                  context: context,
                  icon: Icons.phone_in_talk_outlined,
                  title: 'Call Us',
                  subtitle: '+20 106 047 7678',
                ),
                _buildContactCard(
                  context: context,
                  icon: Icons.location_on_outlined,
                  title: 'Our Location',
                  subtitle: 'Mansoura, Dakahlia, Egypt',
                ),
              ],
            ),
          ),

          // ✅ أيقونة المينيو الثابتة
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

  Widget _buildContactCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        leading: Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
        title: Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}
