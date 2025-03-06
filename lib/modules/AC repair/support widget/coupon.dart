import 'package:flutter/material.dart';
import '../../../utils/custom widgets/custom_outline_card_widget.dart';
import '../../../utils/custom widgets/custom_text.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({super.key});
  
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(2, (index) => SizedBox(
        width: w*0.45, // Adjusted width to match the image size
        height: h*0.07, // Adjusted height for compact design
        child: CustomCardWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5), 
            child: Row(
              children: [
                const Icon(Icons.local_offer, color: Colors.orange, size: 20), // Smaller icon
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center, // Center text vertically
                    children: const [
                      CustomText(text: "Use ZepairRepair", size: 11, fontFamily: FontType.sfPro, weight: FontWeight.bold),
                      CustomText(text: "Get 10% off on First Booking", size: 9, fontFamily: FontType.balooBhai2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
