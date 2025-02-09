import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

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
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
