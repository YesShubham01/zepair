import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/custom widgets/custom_text.dart';

class OTPWidget extends StatelessWidget {
  final String? otp;
  const OTPWidget({super.key, required this.otp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 8), // Adjust vertical padding
      decoration: BoxDecoration(
        color: Color.fromARGB(120, 217, 217, 217),
        borderRadius: BorderRadius.circular(10),
      ),
      // alignment: Alignment., // Ensures text is centered
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: otp!
              .split('')
              .map((digit) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CustomText(
                      text: digit,
                      size: 22,
                      weight: FontWeight.w700,
                      fontFamily: FontType.sfPro,
                      color: Colors.black87,
                    ),
                  ))
              .toList()),
    );
  }
}
