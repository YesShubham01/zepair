import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/backend/warranty_detail_backend.dart';
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

    String userId = "12345";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Warranty"),
      body: SingleChildScrollView(
        // Ensures full scrollability
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(text: "Available Warranty"),
              Gap(h * 0.006),
              WarrantyList(
                warrantyStream:
                    WarrantyService().getUserWarrantiesStream(userId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
