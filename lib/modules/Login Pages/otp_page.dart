import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

import 'package:zepair/widget/otp/otp_appbar.dart';
import 'package:zepair/widget/otp/otp_input_field.dart';
import 'package:zepair/widget/otp/otp_message.dart';
import 'package:zepair/widget/otp/resend_otp.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  late double h;
  late double w;
  int _seconds = 30;
  bool _canResend = false;
  final TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_seconds > 0) {
        setState(() => _seconds--);
        _startTimer();
      } else {
        setState(() => _canResend = true);
      }
    });
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pop(context);
  }
// 390w  h844
  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    
    return Scaffold(
      appBar: OTPAppBar(onBack: () => _navigateToLogin(context)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns everything to the left
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(text: "Verification Code", size: 20),
            Gap(h*0.02),
            const OTPMessage(),
            Gap(h*0.05),
            Align(alignment: Alignment.centerLeft,
              child: OTPInputField(controller: _pinController)),
            Gap(h*0.03),
            ResendOTPSection(
              canResend: _canResend,
              seconds: _seconds,
              onResend: () { 
                setState(() {
                  _seconds = 30;
                  _canResend = false;
                });
                _startTimer();
              },
            ),
            Gap(h*0.155),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                child: const Text(
            'Go back to login page',
            style: TextStyle(
             fontSize: 22,
              color: CustomColors.primary,
              
  ),
),

                
                onPressed: () => _navigateToLogin(context),
              ),
            ),
            
          ],

          
        ),

      
      ),
    );
  }
}
