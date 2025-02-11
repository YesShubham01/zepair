import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Login%20Pages/close_button.dart';
import 'package:zepair/modules/Login%20Pages/custom_button.dart';
import 'package:zepair/modules/Login%20Pages/language_selection_widget.dart';
import 'package:zepair/modules/Login%20Pages/login_screen.dart/close_butto.dart';
import 'package:zepair/modules/Login%20Pages/login_screen.dart/custom_butto.dart';
import 'package:zepair/modules/Login%20Pages/login_screen.dart/language_selection.dart';
import 'package:zepair/modules/Login%20Pages/login_screen.dart/phone_login_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedLanguage = "English";
  late double h;
  late double w;

  void _onLanguageChanged(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      body: Stack(
        children: [
          // 🔥 Background Section
          Column(
            children: [
              Container(
                height: h * 0.38, // Adjusted to match the screenshot
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.yellow],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/Toolbox 1.png',
                    height: 120, // Ensures visibility of the image
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black87, // Match background of phone input page
                ),
              ),
            ],
          ),

          // 🔥 White Container with Rounded Corners
          Positioned(
            top: h * 0.35, // Ensures alignment with the screenshot
            left: 0,
            right: 0,
            child: Container(
              width: w,
              height: h * 0.65,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), 
                  topRight: Radius.circular(10), // Rounded top edges only
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Choose your language",
                    style: TextStyle(
                      fontSize: 18,
                      
                      fontFamily: "SF Pro",
                    ),
                  ),
                  Gap(h * 0.023),
                  LanguageOption(
                    title: "English",
                    subtitle: "ABC",
                    isSelected: selectedLanguage == "English",
                    onTap: () => _onLanguageChanged("English"),
                  ),
                  Gap(h * 0.023),
                  LanguageOption(
                    title: "हिंदी",
                    subtitle: "क ख ग",
                    isSelected: selectedLanguage == "हिंदी",
                    onTap: () => _onLanguageChanged("हिंदी"),
                  ),
                  Gap(h * 0.27),
                  CustomButton(
                    text: "Continue",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PhoneLoginScreen()),
                      );
                    },
                    width: w * 0.87,
                    height: h * 0.06,
                  ),
                ],
              ),
            ),
          ),

          // 🔥 Close Button (Centered at Edge of Yellow & White)
          Positioned(
            top: h * 0.32,
            left: w*0.45, // Centering the close button
            child: const CloseButtonWidget(),
          ),
        ],
      ),
    );
  }
}
