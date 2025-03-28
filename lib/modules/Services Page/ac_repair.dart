import 'package:flutter/material.dart';
import 'package:zepair/models/service_detail_model.dart';
import 'package:zepair/modules/Services%20Page/support%20widget/appointement.dart';
import 'package:zepair/modules/Services%20Page/support%20widget/other%20section.dart';
import 'package:zepair/modules/Services%20Page/support%20widget/warranty.dart';
import 'package:zepair/modules/bill%20page/support%20widget/coupon.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

import '../../utils/custom widgets/custom_appbar.dart';

class ACServicePage extends StatefulWidget {
  final ServiceModel serviceModel;

  const ACServicePage({super.key, required this.serviceModel});

  @override
  State<ACServicePage> createState() => _ACServicePageState();
}

class _ACServicePageState extends State<ACServicePage> {
  late double h;
  late double w;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    h = size.height;
    w = size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        applyBackButton: true,
        customColor: Colors.grey.shade300,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image
            Container(
              height: h * 0.12,
              color: Colors.grey.shade300,
              child: Center(
                child: _getDeviceIcon(widget.serviceModel),
              ),
            ),
            SizedBox(height: h * 0.006),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.019),
                  CustomText(
                    text: widget.serviceModel.title, // ✅ Dynamic Title
                    size: 24,
                    fontFamily: FontType.sfPro,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: h * 0.010),
                  const WarrantySection(),
                  SizedBox(height: h * 0.010),
                  const CouponSection(),
                  SizedBox(height: h * 0.010),
                  AppointmentSection(
                    serviceCategory: widget.serviceModel.title,
                  ),
                  SizedBox(height: h * 0.010),
                  const CustomText(
                    text: "Other Services",
                    fontFamily: FontType.sfPro,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                  // ✅ OtherServicesSection will expand naturally
                  OtherServicesSection(
                    serviceCategory: widget.serviceModel.title,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getDeviceIcon(ServiceModel service) {
    return Hero(
      tag: service.title,
      child: SizedBox(
        height: h * 0.2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
              service.imagePath), // 🔥 Now loading images from Firestore
        ),
      ),
    );
  }
}
