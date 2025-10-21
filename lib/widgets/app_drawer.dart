import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/contact_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final accentColor = Theme.of(context).colorScheme.secondary;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("Ezat Nasef", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
            accountEmail: const Text("ezatyahta@gmail.com", style: TextStyle(color: Colors.white70)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "E",
                style: TextStyle(fontSize: 40.0, color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, accentColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.home_work_outlined,
            text: 'Home',
            routeName: HomeScreen.routeName,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.info_outline,
            text: 'About',
            routeName: AboutScreen.routeName,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.support_agent_outlined,
            text: 'Contact',
            routeName: ContactScreen.routeName,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String text, required String routeName}) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isSelected = currentRoute == routeName;

    return ListTile(
      leading: Icon(icon, color: isSelected ? Theme.of(context).colorScheme.secondary : Colors.grey[700]),
      title: Text(
        text,
        style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.black87),
      ),
      onTap: () {
        Navigator.of(context).pop();
        if (!isSelected) {
          Navigator.of(context).pushReplacementNamed(routeName);
        }
      },
    );
  }
}