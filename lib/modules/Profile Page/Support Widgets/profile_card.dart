import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final double width;
  late double w;
  late double h;

  ProfileCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.width = 150, // Default width
  });

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: CustomColors.containerBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.fromLTRB(0, h * 0.015, 0, h * 0.015),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
            Gap(h * 0.012),
            CustomText(
              text: text,
              size: 18,
              fontFamily: FontType.sfPro,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
