import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ResendOTPSection extends StatelessWidget {
  final bool canResend;
  final int seconds;
  final VoidCallback onResend;

  const ResendOTPSection({
    super.key,
    required this.canResend,
    required this.seconds,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomText(
            text: 'Did not get the OTP?',
            fontFamily: FontType.sfPro,
            size: 17,
            color: CustomColors.black),
        TextButton(
          onPressed: canResend ? onResend : null,
          child: CustomText(
            text: canResend ? 'Resend' : 'Wait $seconds seconds',
            size: 17,
            fontFamily: FontType.sfPro,
            color:
                canResend ? Colors.blue : const Color.fromARGB(100, 91, 91, 91),
          ),
        ),
      ],
    );
  }
}
