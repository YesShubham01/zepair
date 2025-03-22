import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/modules/Home%20Pages/home_screen.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

import 'package:zepair/modules/Login%20Pages/Support%20Widgets/otp/otp_message.dart';
import 'package:zepair/modules/Login%20Pages/Support%20Widgets/otp/resend_otp.dart';

class OTPVerificationPage extends StatefulWidget {
  final String phone;
  final String verificationId;

  const OTPVerificationPage(
      {super.key, required this.phone, required this.verificationId});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  late double h;
  late double w;
  int _seconds = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pop(context);
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      appBar: const CustomAppBar(title: "Verification Code"),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns everything to the left
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //const CustomText(text: "Verification Code", size: 20,fontFamily: FontType.sfPro),
                  Gap(h * 0.02),
                  const OTPMessage(),
                  Gap(h * 0.05),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _otpInputField(),
                  ),
                  Gap(h * 0.03),
                  ResendOTPSection(
                    canResend: _canResend,
                    seconds: _seconds,
                    onResend: () async {
                      setState(() {
                        _seconds = 30;
                        _canResend = false;
                      });

                      _startTimer();

                      try {
                        await AuthenticationBackend.resendCode(
                            widget.phone); // Add this line
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("OTP resent successfully!")),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text("Failed to resend OTP. Try again.")),
                        );
                      }
                    },
                  ),
                  Gap(h * 0.155),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: const CustomText(
                        text: 'Go back to login page',
                        color: Colors.orange,
                        size: 22,
                        fontFamily: FontType.sfPro,
                      ),
                      onPressed: () => _navigateToLogin(context),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _otpInputField() {
    //pinInputDetails.
    final defaultPinTheme = PinTheme(
      width: w * 0.17,
      height: h * 0.07,
      textStyle: const TextStyle(
        fontSize: 24,
        color: CustomColors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(99, 58, 55, 55)),
        borderRadius: BorderRadius.circular(25),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromARGB(99, 216, 101, 43)),
    );

    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      showCursor: true,
      onCompleted: (pin) async {
        print("OTP Entered: $pin");
        _verifyOTP(pin);
      },
    );
  }

  Future<void> _verifyOTP(String pin) async {
    setState(() {
      isLoading = true;
    });

    try {
      bool result =
          await AuthenticationBackend.verifyOtp(pin, widget.verificationId);

      if (!result) {
        _showErrorSnackbar("Incorrect OTP. Please try again.");
      } else {
        // Show success animation and navigate
        showDialog(
          context: context,
          barrierDismissible: false, // Prevent user from dismissing the dialog
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/lotties/wink_animation.json',
                    repeat: true), // Your Lottie animation file
                const Gap(20),
                const CustomText(
                  text: "Verification Successful!",
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
        );

        // Wait for animation to play before navigating
        await Future.delayed(const Duration(seconds: 2));

        // Close the dialog
        if (mounted) {
          Navigator.pop(context);
        }

        // Navigate to the homepage (replace with your actual homepage route)
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      }
    } catch (e) {
      _showErrorSnackbar("Something went wrong. Please try again.");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  // resend code timer.
  Timer? _timer;
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            _canResend = true;
            timer.cancel();
          }
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }
}
