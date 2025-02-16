import 'package:flutter/material.dart';
import '../../../utils/custom widgets/custom_text.dart';

class CouponSection extends StatelessWidget {
  late double h;
  late double w;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coupon Input Box
          Container(
            margin: EdgeInsets.only(top:0.02*h),
            height: h * 0.055, // Slightly increased height
            width: w * 0.85, // Adjusted width
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                // Expanded TextField
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Have a coupon code? Type here",
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                // Divider for separation
                IntrinsicHeight(
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
                  child: Padding(
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

          SizedBox(height: 0.02 * h),

          // Coupon List Section
          CustomText(
            text: "Coupons for you",
            size: 15,
            fontFamily: FontType.sfPro,
            weight: FontWeight.bold,
          ),
          _buildCoupon('Get 10% off on First Booking', 'Use ZepairRepair'),
          _buildCoupon('Get 10% off on First Booking', 'Use ZepairRepair'),
        ],
      ),
    );
  }

  Widget _buildCoupon(String title, String code) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.discount, size: 18, color: Colors.black),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: title, size: 13, fontFamily: FontType.balooBhai2),
                  CustomText(text: code, size: 13, fontFamily: FontType.sfPro),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: CustomText(
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
