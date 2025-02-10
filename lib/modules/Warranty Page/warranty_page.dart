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
  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    width = size.width;
    height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const CustomText(
          text: 'Warranty',
          size: 24,
          weight: FontWeight.w600,
          fontFamily: FontType.sfPro,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(width * 0.05),
        children: [
          const _HeaderText(),
          Gap(height * 0.03),
          WarrantyList(
            warranties: dummyWarranties,
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return const CustomText(
      text: 'Available Warranty',
      size: 24,
      weight: FontWeight.w500,
      fontFamily: FontType.sfPro,
    );
  }
}
