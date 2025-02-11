import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class CustomOutlineButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double? height;
  final double? width;

  const CustomOutlineButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.height,
    this.width,
  });

  @override
  State<CustomOutlineButton> createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  late double h;
  late double w;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;
    return SizedBox(
      width: widget.width ?? w * 0.9,
      height: widget.height ?? h * 0.06,
      child: OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black, // Text color
          side:
              const BorderSide(color: Colors.black, width: 1), // Outline color
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //padding:  const EdgeInsets.only(left: 25, right: 25, bottom: 100),
        ),
        child: CustomText(
            text: widget.buttonText, size: 18, fontFamily: FontType.sfPro),
      ),
    );
  }
}
