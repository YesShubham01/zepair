import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Warranty%20Page/Support%20Widgets/warranty_data.dart';
import 'package:zepair/modules/Warranty%20Page/Support%20Widgets/warranty_list.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class WarrantyPage extends StatefulWidget {
  const WarrantyPage({super.key});

  @override
  State<WarrantyPage> createState() => _WarrantyPageState();
}

class _WarrantyPageState extends State<WarrantyPage> {
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      //! here we can use custom Appbar
      appBar: AppBar(
        title: const CustomText(
          text: 'Warranty',
          size: 24,
          weight: FontWeight.w600,
          fontFamily: FontType.sfPro,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: w * 0.06),
        children: [
          Gap(h * 0.02),
          _getTitleText(),
          Gap(h * 0.015),
          WarrantyList(
            warranties: dummyWarranties,
            width: w,
            height: h,
          ),
        ],
      ),
    );
  }

  _getTitleText() {
    return const CustomText(
      text: 'Available Warranty',
      size: 24,
      weight: FontWeight.w500,
      fontFamily: FontType.sfPro,
    );
  }
}
