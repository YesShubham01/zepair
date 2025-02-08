import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_container.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ZepairLogo extends StatelessWidget {
  final double h;
  final double w;

  const ZepairLogo({
    super.key,
    this.h = 100.0,
    this.w = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: _getGradient(),
      child: Center(
        child: CustomText(
          text: "Zepair",
          size: h / 5, 
        ),
      ),
    );
  }

  Decoration _getGradient() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      gradient: LinearGradient(
        colors: [
          CustomColors.themeGradientStart,
          CustomColors.themeGradientEnd
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}
