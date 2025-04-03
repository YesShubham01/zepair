import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zepair/modules/Payment%20Page/payment_page.dart';
import 'package:zepair/provider/order_cart_provider.dart';
import 'package:zepair/provider/user_datails_provider.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/models/user_detail_model.dart';

import 'support widget/bill_details_section.dart';
import 'support widget/coupon.dart';
import 'support widget/info_tile.dart';
import 'support widget/total.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({
    super.key,
  });

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  late double w;
  late double h;
  late AddressModel selectedAddress;
  String amount = "300";

  @override
  void initState() {
    super.initState();

    // set selectedAddress
    UserDetailModel userDetails =
        context.read<UserDetailsProvider>().userDetail;
    int selectedIndex = userDetails.selectedAddressIndex ?? 0;
    selectedAddress = userDetails.addresses![selectedIndex];

    // set details from OrderCardProvider
    amount = context.read<OrderCartProvider>().amount!.toString();
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;

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
                CustomCardWidget(
                  child: BillDetails(),
                ),
                Positioned(
                  bottom: -40,
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
            const CouponSection(),
            SizedBox(height: 0.02 * h),
            InfoTile(
                title: 'Location of Service', details: selectedAddress.address),
            SizedBox(height: 0.02 * h),
            InfoTile(
                title: 'Name and Phone',
                details: '${selectedAddress.name}, ${selectedAddress.phone}'),
            SizedBox(height: 0.11 * h),
            CustomButton(
                text: "Complete payment",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PaymentPage(amountInRupees: amount),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
