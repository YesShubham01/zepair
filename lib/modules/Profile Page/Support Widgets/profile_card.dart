import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  late double w;
  late double h;

  ProfileCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return SizedBox(
      width: w * 0.30,
      child: CustomCardWidget(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, h * 0.015, 0, h * 0.015),
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
        ),
      ),
    );
  }
}
