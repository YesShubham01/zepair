import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

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
                      const CustomText(
                        text: 'Login with Phone number',
                        size: 24,
                        weight: FontWeight.w400,
                      ),
                      Gap(h * 0.03),
                      _buildPhoneInput(),
                      Gap(h * 0.03),
                      _buildContinueButton(),
                      const Spacer(),
                      _buildTermsText(),
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

  Widget _buildPhoneInput() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(w * 0.024),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(w * 0.03),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/india_flag.png',
                  width: w * 0.06,
                  height: w * 0.06,
                ),
                SizedBox(width: w * 0.02),
                const CustomText(
                  text: '+91',
                  size: 18,
                  weight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const VerticalDivider(
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontSize: w * 0.045,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Enter Phone Number',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: w * 0.04),
              ),
            ),
          ),
        ],
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
          backgroundColor: const Color.fromRGBO(255, 229, 0, 1),
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

  Widget _buildTermsText() {
    return Text.rich(
      TextSpan(
        text: 'By continuing, you agree to our ',
        style: TextStyle(
          fontFamily: 'SF-Pro',
          fontSize: w * 0.04,
          fontWeight: FontWeight.w300,
        ),
        children: [
          _buildClickableText('Terms of Service', () {}),
          const TextSpan(text: ', '),
          _buildClickableText('Privacy Policy', () {}),
          const TextSpan(text: ', '),
          _buildClickableText('Content Policy', () {}),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  TextSpan _buildClickableText(String text, VoidCallback onTap) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }
}
