import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class WarrantyCard extends StatefulWidget {
  final String title;
  final String onDate;
  final String validTill;

  const WarrantyCard({
    super.key,
    required this.title,
    required this.onDate,
    required this.validTill,
  });

  @override
  State<WarrantyCard> createState() => _WarrantyCardState();
}

class _WarrantyCardState extends State<WarrantyCard> {
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;
    return Container(
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: CustomColors.lightGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getImagePlaceHolder(),
          SizedBox(width: w * 0.04),
          _getWarrantyDetailsText(
              widget.title, widget.onDate, widget.validTill),
        ],
      ),
    );
  }

  _getImagePlaceHolder() {
    return SizedBox(
      width: w * 0.2, // 20% of screen width
      height: w * 0.2, // Maintain square aspect ratio
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.containerBg.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
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
            text: title,
            size: 24,
            weight: FontWeight.w400,
            fontFamily: FontType.sfPro,
          ),
          CustomText(
            text: 'On Date: $onDate',
            size: 16,
            weight: FontWeight.w400,
            fontFamily: FontType.balooBhai2,
          ),
          CustomText(
            text: 'Valid Till: $validTill',
            size: 16,
            weight: FontWeight.w400,
            fontFamily: FontType.balooBhai2,
          ),
        ],
      ),
    );
  }
}
