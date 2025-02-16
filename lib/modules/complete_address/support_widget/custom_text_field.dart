import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  late double h;
  late double w;

  CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.005),
      child: TextField(
        decoration: InputDecoration(
            hintText: null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.only(
                left: 0.05 * w, top: 0.02 * h, bottom: 0.02 * h),
            label: CustomText(
              text: hintText,
              size: 18,
              color: const Color.fromARGB(255, 83, 83, 83),
              fontFamily: FontType.sfPro,
            )),
      ),
    );
  }
}
