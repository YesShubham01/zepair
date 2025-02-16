import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        
          
          backgroundColor: Color.fromARGB( 255,234, 190, 17),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: CustomText(
          alignment: TextAlign.center,
          
          text: text,
          size: 22,
          color: Colors.black,
          fontFamily: FontType.sfPro,
         
        ),
      ),
    );
  }
}
