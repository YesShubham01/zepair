import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zepair/utils/constants/colors.dart';

class OTPInputField extends StatelessWidget {
  late double h;
  late double w;
  final TextEditingController controller;

   OTPInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    final defaultPinTheme = PinTheme(
      width: w*0.17,
      height: h*0.07,
      textStyle: const TextStyle(
        fontSize: 24,
        color: CustomColors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(99, 58, 55, 55)),
        borderRadius: BorderRadius.circular(25),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromARGB(99, 216, 101, 43)),
    );

    return Pinput(
        length: 4,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        showCursor: true,
        controller: controller,
        onCompleted: (pin) {
          print("OTP Entered: $pin");
        },
      );
    
  }
}
