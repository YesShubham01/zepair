import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Login%20Pages/Support%20Widgets/language_radio.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late double w;
  late double h;
  String selectedLanguage = 'English';

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
                      const CustomText(
                        text: 'Choose your language',
                        size: 24,
                        weight: FontWeight.w400,
                      ),
                      Gap(h * 0.03),
                      LanguageRadio(
                        w: w,
                        label: 'English',
                        startText: 'A B C',
                        isSelected: selectedLanguage == 'English',
                        onTap: () {
                          setState(() {
                            selectedLanguage = 'English';
                          });
                        },
                      ),
                      Gap(h * 0.03),
                      LanguageRadio(
                        w: w,
                        label: 'हिंदी',
                        startText: 'क ख ग',
                        isSelected: selectedLanguage == 'हिंदी',
                        onTap: () {
                          setState(() {
                            selectedLanguage = 'हिंदी';
                          });
                        },
                      ),
                      const Spacer(),
                      _buildContinueButton(),
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
          // Add continue logic here
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
