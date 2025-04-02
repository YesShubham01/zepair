import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ServiceInProgressBottomBar extends StatelessWidget {
  final String? otp;
  const ServiceInProgressBottomBar({super.key, required this.otp});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
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
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Service in Progress",
            size: 22,
            weight: FontWeight.w500,
            fontFamily: FontType.balooBhai2,
            color: Colors.black,
            alignment: TextAlign.start,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: otp!
                        .split('')
                        .map((digit) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: CustomText(
                                text: digit,
                                size: 22,
                                weight: FontWeight.w700,
                                fontFamily: FontType.sfPro,
                                color: Colors.black87,
                              ),
                            ))
                        .toList()),
              ),
              const SizedBox(width: 12),
              const Expanded(
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
