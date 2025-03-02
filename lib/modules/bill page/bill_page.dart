import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';

import 'support widget/bill.dart';
import 'support widget/coupon.dart';
import 'support widget/service_details.dart';
import 'support widget/total.dart';

class BillScreen extends StatelessWidget {
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bill'),
        leading: Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Bill Details with proper border styling
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: BillDetails(),
                ),
                // Total Amount overlapping correctly
                Positioned(
                  bottom: -40, // Overlap amount
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(12),
                   height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: TotalAmount(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.09 * h),
            CouponSection(),
            SizedBox(height: 0.02 * h),
            InfoTile(title: 'Location of Service', details: 'house no. 412, Type 4A, Colony, Hisar'),
            SizedBox(height: 0.02 * h),
            InfoTile(title: 'Name and Phone', details: 'Shubham Puhal, +91 123456789'),
            SizedBox(height: 0.11 * h),
            CustomButton(text: "Complete payment", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
