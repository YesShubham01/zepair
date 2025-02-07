import 'package:flutter/material.dart';
import 'package:zepair/modules/Splash%20Page/Support%20Widgets/splash_content.dart';
import 'package:zepair/utils/constants/colors.dart';

class SplashBox extends StatelessWidget {
  const SplashBox({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final size = _calculateBoxSize(constraints);
          return Container(
            width: size,
            height: size,
            decoration: _boxDecoration,
            child: const Center(child: SplashContent()),
          );
        },
      );

  double _calculateBoxSize(BoxConstraints constraints) =>
      constraints.maxWidth < constraints.maxHeight
          ? constraints.maxWidth * 0.6
          : constraints.maxHeight * 0.6;

  BoxDecoration get _boxDecoration => BoxDecoration(
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
