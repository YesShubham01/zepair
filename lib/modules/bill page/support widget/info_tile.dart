import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';

import '../../../utils/custom widgets/custom_text.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String details;
  late double h;
  late double w;

  InfoTile({super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;
    return CustomCardWidget(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  size: 17,
                  fontFamily: FontType.sfPro,
                  weight: FontWeight.bold,
                ),
                CustomText(
                  text: details,
                  size: 15,
                  fontFamily: FontType.balooBhai2,
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 25),
          ],
        ),
      ),
    );
  }
}
