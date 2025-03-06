import 'package:flutter/material.dart';

import '../../../utils/custom widgets/custom_outline_card_widget.dart';
import '../../../utils/custom widgets/custom_text.dart';

class WarrantySection extends StatelessWidget {
  const WarrantySection({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              children: [
                const Icon(Icons.verified, color: Colors.green, size: 20),
                CustomText(text: "Warranty", size: 12, fontFamily: FontType.balooBhai2),
              ],
            ),
            const SizedBox(width: 10),
            const CustomText(text: "Get Warranty up to 15 days", size: 17),
          ],
        ),
      ),
    );
  }
}
