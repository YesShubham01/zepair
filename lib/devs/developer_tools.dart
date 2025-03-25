import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DeveloperToolsPage extends StatefulWidget {
  const DeveloperToolsPage({super.key});

  @override
  State<DeveloperToolsPage> createState() => _DeveloperToolsPageState();
}

class _DeveloperToolsPageState extends State<DeveloperToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  // AppBar
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Developer Tools',
        style: TextStyle(
          color: Colors.cyanAccent,
          fontWeight: FontWeight.bold,
          fontSize: 24,
          letterSpacing: 1.5,
        ),
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
    );
  }

  // Body UI
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: _devButtons.map((btn) => _buildButton(btn)).toList(),
      ),
    );
  }

  // Developer Buttons List
  final List<_DevButton> _devButtons = [
    // _DevButton("Clear Cache", LucideIcons.trash2,
    //     () => _showSnackBar("Cache Cleared")),
    // _DevButton("Reset Database", LucideIcons.database,
    //     () => _showSnackBar("Database Reset")),
    // _DevButton("Restart App", LucideIcons.refreshCcw,
    //     () => _showSnackBar("App Restarted")),
    // _DevButton("Enable Debug Mode", LucideIcons.bug,
    //     () => _showSnackBar("Debug Mode Enabled")),
    // _DevButton(
    //     "View Logs", LucideIcons.fileText, () => _showSnackBar("Opening Logs")),
  ];

  // Button UI
  Widget _buildButton(_DevButton btn) {
    return GestureDetector(
      onTap: btn.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        decoration: _buttonDecoration(),
        child: Row(
          children: [
            Icon(btn.icon, color: Colors.cyanAccent, size: 28),
            const SizedBox(width: 20),
            Text(
              btn.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Button Styling
  BoxDecoration _buttonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white.withOpacity(0.1),
      border: Border.all(color: Colors.cyanAccent.withOpacity(0.5), width: 1.5),
      boxShadow: [
        BoxShadow(
          color: Colors.cyanAccent.withOpacity(0.3),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    );
  }

  // Functionality - Actions
  static void _showSnackBar(String message) {
    print(message); // Replace with actual function later
  }
}

// Model Class for Buttons
class _DevButton {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  _DevButton(this.title, this.icon, this.onTap);
}
