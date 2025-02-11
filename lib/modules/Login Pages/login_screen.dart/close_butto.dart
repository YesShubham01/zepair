import 'package:flutter/material.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.white,
      child: Center(
        // Ensures the icon is centered
        child: IconButton(
          padding: EdgeInsets.zero, // Removes extra padding from IconButton
          constraints:
              const BoxConstraints(), // Prevents unnecessary constraints
          icon: const Icon(Icons.close, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
