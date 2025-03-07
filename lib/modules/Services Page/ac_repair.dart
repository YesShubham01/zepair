import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import '../../utils/custom widgets/custom_outline_card_widget.dart';
import '../../utils/custom widgets/custom_text.dart';
import 'support widget/appointement.dart';
import 'support widget/coupon.dart';
import 'support widget/other section.dart';
import 'support widget/top section.dart';
import 'support widget/warranty.dart';

class ACServicePage extends StatelessWidget {
  const ACServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopImagePlaceholder(height: h * 0.225, width: w * 0.93),
              SizedBox(height: h * 0.006),
              CustomText(text: "AC Repair & Service",size: 24,fontFamily: FontType.sfPro,),
              
              const WarrantySection(),
              SizedBox(height: h * 0.006),
              const CouponSection(),
              SizedBox(height: h * 0.006),
              const AppointmentSection(),
              SizedBox(height: h * 0.006),
              const OtherServicesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
