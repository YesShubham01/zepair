import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zepair/provider/order_cart_provider.dart';
import 'package:zepair/utils/custom%20widgets/custom_loading_screen.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class BillDetails extends StatelessWidget {
  late double h;
  late double w;

  BillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;
    String amount = context.read<OrderCartProvider>().amount!.toString();
    String title = context.read<OrderCartProvider>().title!;
    String description = context.read<OrderCartProvider>().description!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRow(title, amount, subtitle: description),
        const Gap(5),
        _buildRow('Coupon code applied', '-₹0',
            subtitle: 'ZepairRepair: Get 10% off on first Booking'),
      ],
    ).pSymmetric(h: w * 0.05, v: h * 0.005);
  }

  Widget _buildRow(String title, String price, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  size: 17,
                  fontFamily: FontType.sfPro,
                ),
                if (subtitle != null)
                  CustomText(
                    text: subtitle,
                    size: 12,
                    fontFamily: FontType.balooBhai2,
                  ),
              ],
            ),
          ),
          CustomText(
            text: price,
            size: 16,
            fontFamily: FontType.sfPro,
            //weight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
