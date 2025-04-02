import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class CustomOutlineButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? color;

  const CustomOutlineButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.color,
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
      width: w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: h * 0.01),
        child: OutlinedButton(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: widget.color ?? Colors.black, width: 1), // Outline color
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: CustomText(
            text: widget.buttonText,
            size: 18,
            fontFamily: FontType.sfPro,
            color: widget.color ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
