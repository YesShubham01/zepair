import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class CustomOutlineButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomOutlineButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black, // Text color
        side: const BorderSide(color: Colors.black, width: 1), // Outline color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        //padding:  const EdgeInsets.only(left: 25, right: 25, bottom: 100),
      ),
      child: CustomText(text: buttonText, size: 18, fontFamily: FontType.sfPro),
    );
  }
}
