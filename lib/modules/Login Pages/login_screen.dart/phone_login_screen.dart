import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Login%20Pages/custom_button.dart';
import 'package:zepair/modules/Login%20Pages/login_screen.dart/custom_butto.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  late double h;
  late double w;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: h * 0.40, // Increased yellow background height
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.yellow, Colors.orange],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/Toolbox 1.png',
                    height: 120,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: h * 0.35, // Position white container slightly overlapping yellow
            child: Container(
              width: w,
              height: h * 0.65, // Adjusted white container height
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login with Phone number",
                    style: TextStyle(fontSize: 18, fontFamily: "SF Pro"),
                  ),
                  Gap(h * 0.015), // Adjusted spacing

                  _buildPhoneInput(),

                  Gap(h * 0.035), // Adjusted spacing

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

                  const Spacer(), // Pushes Terms & Conditions to the bottom

                  _buildTermsAndConditions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildFlagContainer(),
          Gap(w * 0.025),
          _buildPhoneNumberContainer(),
        ],
      ),
    );
  }

  Widget _buildFlagContainer() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
        ],
      ),
      child: Image.asset(
        "assets/images/Flag.png",
        width: 30,
        height: 20,
      ),
    );
  }

  Widget _buildPhoneNumberContainer() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Text(
              "+91",
              style: TextStyle(fontSize: 16, fontFamily: "SF Pro"),
            ),
            Gap(w * 0.02),
            Expanded(
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Phone Number",
                  hintStyle:
                      TextStyle(color: Colors.grey, fontFamily: "SF Pro"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return  Center(
      child: Text.rich(
        TextSpan(
          text: " By continuing, you agree to our \n",
      
          style: TextStyle(color: Colors.black87),
          children: [
            TextSpan(
              text: "Terms of Service",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: "SF Pro",
              ),
            ),
            TextSpan(text: ", "),
            TextSpan(
                text: "Privacy Policy",
                style: TextStyle(decoration: TextDecoration.underline)),
            TextSpan(text: ", "),
            TextSpan(
                text: "Content Policy",
                style: TextStyle(decoration: TextDecoration.underline,fontFamily: "SF Pro",)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
