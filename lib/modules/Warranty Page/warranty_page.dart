import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Warranty%20Page/Support%20Widgets/warranty_data.dart';
import 'package:zepair/modules/Warranty%20Page/Support%20Widgets/warranty_list.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_title.dart';

import '../../utils/custom widgets/custom_appbar.dart';

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
      appBar: const CustomAppBar(title: "Warranty"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
        children: [
          CustomTitle(text: "Available Warranty"),
          Gap(h * 0.006),
          WarrantyList(
            warranties: dummyWarranties,
            width: w,
            height: h,
          ),
        ],
      ),
    );
  }
}
