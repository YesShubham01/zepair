import 'package:flutter/material.dart';

class SplashTagline extends StatelessWidget {
  const SplashTagline({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: FittedBox(
          child: Text(
            'Want to Repair? Use Zepair',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontWeight: FontWeight.w100,
              color: Colors.black87,
            ),
          ),
        ),
      );
}
