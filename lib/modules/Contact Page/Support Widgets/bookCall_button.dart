import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class BookCallButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;

  const BookCallButton({
    Key? key,
    required this.onPressed,
    this.width = 370,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: CustomText(
            text: "Book Call",
            size: 22,
            fontFamily: FontType.sfPro,
            weight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
