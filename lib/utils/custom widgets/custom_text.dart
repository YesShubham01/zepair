import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';

enum FontType {
  sfPro,
  balooBhai2,
  balsamiqSans,
}

class CustomText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight weight;
  final FontType fontFamily;
  final TextAlign alignment;

  const CustomText({
    super.key,
    required this.text,
    this.size = 24.0,
    this.color = CustomColors.black,
    this.weight = FontWeight.w500,
    this.fontFamily = FontType.sfPro,
    this.alignment = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily:
            _getFontFamily(), // Ensure this font is added in pubspec.yaml
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
      textAlign: alignment,
    );
  }

  String _getFontFamily() {
    if (fontFamily == FontType.balsamiqSans) {
      return "BalsamiqSans";
    } else if (fontFamily == FontType.balooBhai2) {
      return "Baloo-Bhai-2";
    } else {
      return "SF-Pro";
    }
  }
}
