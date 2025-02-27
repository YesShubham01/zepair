import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

import '../../../utils/custom widgets/custom_outline_card_widget.dart';

class AppointmentSection extends StatelessWidget {
  const AppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(text:
          "Book Appointment",
          size: 24, weight: FontWeight.bold,fontFamily:FontType.sfPro),
        
        SizedBox(height: h * 0.01),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomCardWidget(
                    child: Container(
                      height: h * 0.10,
                      width: w * 0.43,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.008),
                  const CustomText(text:
                    "Book a Service",
                    size: 16, fontFamily: FontType.balooBhai2,
                    alignment: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(width: w * 0.02),
            Expanded(
              child: Column(
                children: [
                  CustomCardWidget(
                    child: Container(
                      height: h * 0.10,
                      width: w * 0.43,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.008),
                  const CustomText(text:
                    "Book Checkup & Repair",size: 16,
                    fontFamily: FontType.balooBhai2,
                    alignment: TextAlign.center,

                   
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
