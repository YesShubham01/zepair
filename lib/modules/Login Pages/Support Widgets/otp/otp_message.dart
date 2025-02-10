import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';


class OTPMessage extends StatelessWidget {
  const OTPMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomText(
      text: 'We have sent you the verification code on your phone number.',
      size:20,
      fontFamily: FontType.sfPro,
      color:CustomColors.black
    );
  }
}
