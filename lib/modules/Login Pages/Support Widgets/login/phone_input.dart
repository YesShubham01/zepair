import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class PhoneInput extends StatelessWidget {
  final double w;

  const PhoneInput({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(w * 0.024),
          ),
          padding: EdgeInsets.all(w * 0.03),
          child: Image.asset(
            'assets/images/india_flag.png',
            width: w * 0.06,
            height: w * 0.06,
          ),
        ),
        SizedBox(width: w * 0.02),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(w * 0.024),
            ),
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Row(
              children: [
                const CustomText(
                  text: '+91',
                  size: 18,
                  weight: FontWeight.w400,
                ),
                SizedBox(width: w * 0.02),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter Phone Number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
