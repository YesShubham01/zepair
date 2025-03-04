import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class BillDetails extends StatelessWidget {
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        //border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow('AC Service', '₹450', subtitle: 'AC cleaning and service'),
          SizedBox(height: 5),
          _buildRow('Coupon code applied', '-₹45', subtitle: 'ZepairRepair: Get 10% off on first Booking'),
        ],
      ),
    );
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
                 // weight: FontWeight.bold,
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
