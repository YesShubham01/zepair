import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zepair/utils/constants/colors.dart';
import '../../utils/custom widgets/custom_button.dart';
import '../../utils/custom widgets/custom_text.dart';

import 'Support widget/image/image.dart';
import 'Support widget/otp bar/otp.dart';


class ServiceProgressPage extends StatelessWidget {
  final String otp;

  const ServiceProgressPage({super.key, required this.otp});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    double h = size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.02),

            // Centered Image & Title
            Center(
              child: Column(
                children: [
                  ImageWidget(height: h * 0.2, width: 1.5* w),
                  SizedBox(height: h * 0.02),
                  const CustomText(
                    text: "Your Service in Progress",
                    size: 26,
                    fontFamily: FontType.balooBhai2,
                   
                    alignment: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Divider(
              color: Color.fromARGB(100, 195, 195, 195),
              thickness: 3,
            ),
            SizedBox(height: h * 0.02),

            // OTP Section
            const CustomText(
              text: "OTP",
              size: 22,
              fontFamily: FontType.sfPro,
             
            ),
            SizedBox(height: h * 0.01),

            // OTP Widget with Copy Button Outside
            Row(
              children: [
                Expanded(
                  child: OTPWidget(otp: otp),
                ),
                SizedBox(width: w * 0.02),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: otp));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("OTP Copied!")),
                    );
                  },
                  child: const CustomText(
                    text: "Copy",
                    size: 22,
                    fontFamily: FontType.sfPro,
                    
                    color:CustomColors.primary,
                  ),
                ),
              ],
            ),

            SizedBox(height: h * 0.02),
            const CustomText(
              text: "Share this Otp with technician once service is completed.",
              size: 20,
              alignment: TextAlign.start,
              color: Colors.black,
              fontFamily: FontType.balooBhai2,
            ),
            SizedBox(height: h * 0.02),

            GestureDetector(
              onTap: () {},
              child: const CustomText(
                text: "Need Help?",
                size: 16,
                fontFamily: FontType.sfPro,
                color: CustomColors.primary,
                
              ),
            ),

            const Spacer(),

            CustomButton(
              
              text: "Done",
              onPressed: () {}, // Action here
            ),

            SizedBox(height: h * 0.05),
          ],
        ),
      ),
    );
  }
}
