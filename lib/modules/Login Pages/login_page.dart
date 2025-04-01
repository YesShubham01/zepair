import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/backend/authentication_backend.dart';
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

  bool isLoading = false;

  final TextEditingController phoneNumberController = TextEditingController();
  @override
  void initState() {
    super.initState();
    phoneNumberController.text = '';
  }

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
                      _buildPhoneInputField(),
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

  Widget _buildPhoneInputField() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(w * 0.024),
          ),
          padding: EdgeInsets.all(w * 0.03),
          child: Image.asset(
            'assets/images/india_flag.png',
            width: w * 0.06,
            height: w * 0.06,
          ),
        ),
        SizedBox(width: w * 0.02),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(w * 0.024),
            ),
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Row(
              children: [
                const CustomText(
                  text: '+91',
                  size: 18,
                  weight: FontWeight.w400,
                ),
                SizedBox(width: w * 0.02),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    style: TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter Phone Number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          // Add login logic here
          String phoneNumberWithCountryCode =
              "+91${phoneNumberController.text}";

          // print(phoneNumberWithCountryCode);
          await AuthenticationBackend.signInWithPhone(
              phoneNumberWithCountryCode, context);

          setState(() {
            isLoading = false;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.buttonBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(w * 0.024),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : CustomText(
                text: 'Continue',
                size: w * 0.045,
                weight: FontWeight.w500,
                color: Colors.black,
              ),
      ),
    );
  }
}
