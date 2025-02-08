import 'package:flutter/material.dart';

class OTPAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBack;

  const OTPAppBar({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBack,
      ),
      
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
