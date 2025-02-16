import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/custom widgets/custom_text.dart';

class OTPWidget extends StatelessWidget {
  final String otp;
  const OTPWidget({super.key, required this.otp});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures it takes full available width
      padding: const EdgeInsets.symmetric(vertical: 8), // Adjust vertical padding
      decoration: BoxDecoration(
        color: Color.fromARGB(120, 217, 217, 217),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center, // Ensures text is centered
      child: CustomText(
        text: otp,
        size: 24,
        weight: FontWeight.bold,
        
      ),
    );
  }
}
