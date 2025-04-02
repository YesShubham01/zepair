import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:zepair/backend/appointment_service.dart';
import 'package:zepair/modules/Feedback%20Page/feedback_page.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/constants/image_paths.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import '../../utils/custom widgets/custom_button.dart';
import '../../utils/custom widgets/custom_text.dart';

import 'Support widget/image/image.dart';
import 'Support widget/otp bar/otp.dart';

class ServiceProgressPage extends StatelessWidget {
  final String? otp;
  final String appointmentId;

  const ServiceProgressPage({super.key, this.otp, required this.appointmentId});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    double h = size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: const CustomAppBar(
        title: " ",
        applyBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Image & Title
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width:
                        w * 0.55, // Reduce width to adjust its height as well
                    height: h * 0.25, // Explicitly set height to reduce space
                    child: Lottie.asset(
                      ImagePaths.serviceProgressAnimation,
                      // Ensure it fits within the given size
                    ),
                  ),
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
                    Clipboard.setData(ClipboardData(text: otp!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("OTP Copied!")),
                    );
                  },
                  child: const CustomText(
                    text: "Copy",
                    size: 22,
                    fontFamily: FontType.sfPro,
                    color: CustomColors.primary,
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

            StreamBuilder<bool>(
              stream:
                  AppointmentService().isAppointmentCompleted(appointmentId),
              builder: (context, snapshot) {
                bool isCompleted = snapshot.data ?? false;

                return CustomButton(
                  isActive: isCompleted,
                  text: "Done",
                  onPressed: isCompleted
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedbackPage(
                                      appointmentId: appointmentId,
                                    )),
                          );
                        }
                      : () {}, // Disables button when service is not completed
                  // Set button state based on completion status
                );
              },
            ),

            SizedBox(height: h * 0.05),
          ],
        ),
      ),
    );
  }
}
