import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class SplashTagline extends StatelessWidget {
  const SplashTagline({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: FittedBox(
          child: CustomText(
            text: 'Want to Repair? Use Zepair',
            size: MediaQuery.of(context).size.width * 0.045,
            color: CustomColors.black,
            fontFamily: FontType.balooBhai2,
          ),
        ),
      );
}
