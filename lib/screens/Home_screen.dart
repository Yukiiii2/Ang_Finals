import 'package:flutter/material.dart';
import 'add_phone_screen.dart';
import 'phone_list_screen.dart';
import 'remove_phone_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'PhoneKeeper',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF141E30), Color(0xFF243B55)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMenuButton(
                context: context,
                title: 'Add Phone',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddPhoneScreen()),
                ),
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context: context,
                title: 'View Phone List',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhoneListScreen()),
                ),
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context: context,
                title: 'Remove Phone',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RemovePhoneScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple.shade700,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 48.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 8,
        shadowColor: Colors.black26,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
