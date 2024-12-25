import 'package:flutter/material.dart';
import '../widgets/navbar.dart'; // Import the navbar widget
import '../widgets/header.dart'; // Import the Header widget

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        logoAssetPath: '../../../assets/bubaking.png', // Path to your logo image
        icon: Icons.settings, // Icon for settings or another action
        onIconPressed: () {
          // Handle the icon press here
          print("Settings icon pressed!");
        },
      ),
      body: const Center(
        child: Text('Jala buba cepaš ajmoooo'),
      ),
      bottomNavigationBar: const NavigationBarApp(), // Your custom navbar widget
    );
  }
}
