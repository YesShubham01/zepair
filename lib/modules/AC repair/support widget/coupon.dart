import 'package:flutter/material.dart';

import '../../../utils/custom widgets/custom_outline_card_widget.dart';
import '../../../utils/custom widgets/custom_text.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(2, (index) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: CustomCardWidget(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(Icons.local_offer, color: Colors.orange, size: 24),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomText(text: "Use ZeepairRepair", size: 12, fontFamily: FontType.sfPro),
                        CustomText(text: "Get 10% off on first booking", size: 10, fontFamily: FontType.balooBhai2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}