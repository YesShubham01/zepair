import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Login%20Pages/Support%20Widgets/login/phone_input.dart';
import 'package:zepair/modules/Login%20Pages/Support%20Widgets/login/terms_text.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: h,
          child: Column(
            children: [
              _buildGradientHeader(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(h * 0.04),
                      CustomTitle(
                        text: 'Login with Phone number',
                      ),
                      Gap(h * 0.02),
                      PhoneInput(w: w),
                      Gap(h * 0.03),
                      _buildContinueButton(),
                      const Spacer(),
                      TermsText(w: w),
                      Gap(h * 0.025),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientHeader() {
    return Container(
      width: w,
      height: h * 0.35, // 35% of screen height
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.themeGradientStart,
            CustomColors.themeGradientEnd,
          ],
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/toolbox.png',
          width: w * 0.5, // 50% of screen width
          height: w * 0.5, // maintain square aspect ratio
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: w * 0.88,
      height: h * 0.06,
      child: ElevatedButton(
        onPressed: () {
          // Add login logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.buttonBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(w * 0.024),
          ),
        ),
        child: CustomText(
          text: 'Continue',
          size: w * 0.045,
          weight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
