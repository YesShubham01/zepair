import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive
              ? const Color.fromARGB(255, 234, 190, 17)
              : CustomColors.customGrey,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
                color: Colors.black, width: 1), // **Black Outline**
          ),
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
