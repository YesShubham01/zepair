import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class WarrantyCard extends StatelessWidget {
  final String title;
  final String onDate;
  final String validTill;
  final double width;
  final double height;

  const WarrantyCard({
    super.key,
    required this.title,
    required this.onDate,
    required this.validTill,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: CustomColors.lightGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImagePlaceholder(screenWidth: width),
          SizedBox(width: width * 0.04),
          Expanded(
            child: _WarrantyDetails(
              title: title,
              onDate: onDate,
              validTill: validTill,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  final double screenWidth;

  const _ImagePlaceholder({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.2, // 20% of screen width
      height: screenWidth * 0.2, // Maintain square aspect ratio
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.containerBg.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class _WarrantyDetails extends StatelessWidget {
  final String title;
  final String onDate;
  final String validTill;
  final double height;

  const _WarrantyDetails({
    required this.title,
    required this.onDate,
    required this.validTill,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
