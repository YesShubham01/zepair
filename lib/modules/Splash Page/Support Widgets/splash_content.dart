import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) => const Text(
        'Zepair',
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w100,
          color: Colors.black,
        ),
      );
}
