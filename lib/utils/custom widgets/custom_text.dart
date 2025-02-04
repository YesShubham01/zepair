import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';

class CustomText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight weight;

  const CustomText(
      {super.key,
      required this.text,
      this.size = 16.0,
      this.color = CustomColors.black,
      this.weight = FontWeight.w300});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'BalsamiqSans', // Ensure this font is added in pubspec.yaml
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
