import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import '../../../utils/custom widgets/custom_text.dart';

class CouponSection extends StatelessWidget {
  late double h;
  late double w;

  CouponSection({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;

    return CustomCardWidget(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coupon Input Box
            CustomCardWidget(
              color: Colors.white38,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                child: Row(
                  children: [
                    // Expanded TextField
                    const Expanded(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Have a coupon code? Type here",
                          hintStyle:
                              TextStyle(color: Colors.black54, fontSize: 12),
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    // Divider for separation
                    const IntrinsicHeight(
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                        width: 10,
                      ),
                    ),

                    // Apply Button
                    GestureDetector(
                      onTap: () {
                        print("Apply clicked!");
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: CustomText(
                          text: "Apply",
                          size: 14,
                          color: Colors.black,
                          weight: FontWeight.bold,
                          fontFamily: FontType.sfPro,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 0.005 * h),

            // Coupon List Section
            const CustomText(
              text: "Coupons for you",
              size: 15,
              fontFamily: FontType.sfPro,
              weight: FontWeight.bold,
            ),
            _buildCoupon('Get 10% off on First Booking', 'Use ZepairRepair'),
            _buildCoupon('Get 10% off on First Booking', 'Use ZepairRepair'),
          ],
        ),
      ),
    );
  }

  Widget _buildCoupon(String title, String code) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.discount, size: 18, color: CustomColors.primary),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: title, size: 13, fontFamily: FontType.balooBhai2),
                  CustomText(text: code, size: 13, fontFamily: FontType.sfPro),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const CustomText(
              text: "Use",
              size: 14,
              fontFamily: FontType.sfPro,
              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
