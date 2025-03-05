import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TermsText extends StatelessWidget {
  final double w;

  const TermsText({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'By continuing, you agree to our\n',
        style: TextStyle(
          fontFamily: 'SF-Pro',
          fontSize: w * 0.04,
          fontWeight: FontWeight.w300,
        ),
        children: [
          _buildClickableText('Terms of Service', () {}),
          const TextSpan(text: ', '),
          _buildClickableText('Privacy Policy', () {}),
          const TextSpan(text: ', '),
          _buildClickableText('Content Policy', () {}),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  TextSpan _buildClickableText(String text, VoidCallback onTap) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }
}
