import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';

import '../../../utils/custom widgets/custom_text.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({super.key});

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> {
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    double size = w * 0.52;

    return Container(
      width: size,
      height: size,
      decoration: _getBoxDecoration(),
      child: Center(child: _getLogoText()),
    );
  }

  _getBoxDecoration() {
    return BoxDecoration(
      // borderRadius: BorderRadius.circular(24),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          CustomColors.themeGradientStart,
          CustomColors.themeGradientEnd,
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 7,
          offset: const Offset(4, 10),
        ),
      ],
    );
  }

  Widget _getLogoText() {
    return const CustomText(
      text: 'Zepair',
      size: 48,
      weight: FontWeight.w100,
      color: Colors.black,
      fontFamily: FontType.balsamiqSans,
    );
  }
}
