

import 'package:flutter/material.dart';
import 'package:zepair/modules/AC%20repair/support%20widget/appointement.dart';
import 'package:zepair/modules/AC%20repair/support%20widget/coupon.dart';
import 'package:zepair/modules/AC%20repair/support%20widget/other%20section.dart';
import 'package:zepair/modules/AC%20repair/support%20widget/top%20section.dart';
import 'package:zepair/modules/AC%20repair/support%20widget/warranty.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';


class ACServicePage extends StatelessWidget {
  const ACServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Top Image
              TopImagePlaceholder(height: h * 0.230, width: w),
              SizedBox(height: h * 0.006),

              // Rest of the page
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.019),
                        CustomText(
                          text: "AC Repair & Service",
                          size: 24,
                          fontFamily: FontType.sfPro,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(height: h * 0.010),
                        const WarrantySection(),
                        SizedBox(height: h * 0.010),
                        const CouponSection(),
                        SizedBox(height: h * 0.010),
                        const AppointmentSection(),
                        SizedBox(height: h * 0.010),
                        const OtherServicesSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Transparent AppBar on Top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent, 
              elevation: 0,
              title: const Text(''),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black), 
                onPressed: () {
                  Navigator.pop(context); 
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
