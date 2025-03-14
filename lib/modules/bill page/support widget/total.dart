import 'package:flutter/material.dart';

import '../../../utils/custom widgets/custom_text.dart';

class TotalAmount extends StatelessWidget {
  final String amount;

  const TotalAmount({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    double w = dimensions.width;
    double h = dimensions.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
              text: "Total Amount", size: 20, fontFamily: FontType.sfPro),
          CustomText(text: amount, size: 20, fontFamily: FontType.sfPro),
        ],
      ),
    );
  }
}
