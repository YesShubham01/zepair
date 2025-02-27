import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ServiceInProgressBottomBar extends StatelessWidget {
  const ServiceInProgressBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            CustomColors.themeGradientStart,
            CustomColors.themeGradientEnd,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomText(
            text: "Service in Progress",
            size: 20,
            weight: FontWeight.w500,
            fontFamily: FontType.balooBhai2,
            color: Colors.black,
            alignment: TextAlign.start,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const CustomText(
                  text: "8 1 4 7 7 1",
                  size: 20,
                  weight: FontWeight.w700,
                  fontFamily: FontType.sfPro,
                ),
              ),
              const SizedBox(width: 12),
              const Flexible(
                child: CustomText(
                  text: "Share this with technician once service is completed.",
                  size: 14,
                  weight: FontWeight.w400,
                  fontFamily: FontType.balooBhai2,
                  color: Colors.black,
                  alignment: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
