import 'package:flutter/material.dart';

import '../../../utils/custom widgets/custom_text.dart';

class TotalAmount extends StatelessWidget {
  late double h;
  late double w;
  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;
    return Container(
       padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: "Total Amount",size:20,fontFamily: FontType.sfPro),
          CustomText(text:"450",size:20,fontFamily: FontType.sfPro),
        ],
      ),
    );
  }
}