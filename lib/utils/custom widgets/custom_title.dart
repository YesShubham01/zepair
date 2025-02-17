import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class CustomTitle extends StatelessWidget {
  String text;
  CustomTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      fontFamily: FontType.sfPro,
      size: 22,
      weight: FontWeight.bold,
    );
  }
}
