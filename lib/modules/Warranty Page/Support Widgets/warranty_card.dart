import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/serviceEnum.dart';

class WarrantyCard extends StatefulWidget {
  final Device device;
  final String onDate;
  final String validTill;

  const WarrantyCard({
    super.key,
    required this.device,
    required this.onDate,
    required this.validTill,
  });

  @override
  State<WarrantyCard> createState() => _WarrantyCardState();
}

class _WarrantyCardState extends State<WarrantyCard> {
  late double w;
  late double h;
  late Device device;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;

    device = widget.device;
    return CustomCardWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getImagePlaceHolder(),
            Gap(h * 0.006),
            _getWarrantyDetailsText(
                widget.device.title, widget.onDate, widget.validTill),
          ],
        ),
      ),
    );
  }

  _getImagePlaceHolder() {
    return CustomCardWidget(
      child: SizedBox(
        width: w * 0.16, // 20% of screen width
        height: w * 0.16, // Maintain square aspect ratio
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(widget.device.icon),
        ),
      ),
    );
  }

  _getWarrantyDetailsText(String title, String onDate, String validTill) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: widget.device.title,
            size: 18,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: 'On Date: $onDate',
            size: 16,
            weight: FontWeight.w400,
          ),
          CustomText(
            text: 'Valid Till: $validTill',
            size: 16,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
