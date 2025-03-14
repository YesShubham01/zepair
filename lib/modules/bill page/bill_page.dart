import 'package:flutter/material.dart';
import 'package:zepair/modules/Payment%20Page/payment_page.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';

import 'support widget/bill.dart';
import 'support widget/coupon.dart';
import 'support widget/info_tile.dart';
import 'support widget/total.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  late double w;

  late double h;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;

    String amount = "100";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        applyBackButton: true,
        title: 'Complete Payment',
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding:
            EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
        child: Column(
          children: [
            SizedBox(height: 0.02 * h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Bill Details with proper border styling
                CustomCardWidget(
                  child: BillDetails(),
                ),
                // Total Amount overlapping correctly
                Positioned(
                  bottom: -40, // Overlap amount
                  left: 0,
                  right: 0,
                  child: CustomCardWidget(
                    child: TotalAmount(
                      amount: amount,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.06 * h),
            CouponSection(),
            SizedBox(height: 0.02 * h),
            InfoTile(
                title: 'Location of Service',
                details: 'house no. 412, Type 4A, Colony, Hisar'),
            SizedBox(height: 0.02 * h),
            InfoTile(
                title: 'Name and Phone',
                details: 'Shubham Puhal, +91 123456789'),
            SizedBox(height: 0.11 * h),
            CustomButton(
                text: "Complete payment",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PaymentPage(
                            amountInRupees: amount,
                          )));
                }),
          ],
        ),
      ),
    );
  }
}
