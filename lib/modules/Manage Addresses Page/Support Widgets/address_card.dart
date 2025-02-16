import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class AddressCard extends StatelessWidget {
  final String type;
  final String address;
  final String name;
  final String phoneNumber;

  const AddressCard({
    super.key,
    required this.type,
    required this.address,
    required this.name,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 0,
          bottom: 10,
          top: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: type,
                  size: 20,
                  weight: FontWeight.w500,
                  fontFamily: FontType.sfPro,
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    // Handle options menu
                  },
                ),
              ],
            ),
            CustomText(
              text: address,
              size: 16,
              weight: FontWeight.w400,
              fontFamily: FontType.balooBhai2,
            ),
            const SizedBox(height: 4),
            CustomText(
              text: "$name, $phoneNumber",
              size: 16,
              weight: FontWeight.w400,
              color: Colors.grey,
              fontFamily: FontType.balooBhai2,
            ),
          ],
        ),
      ),
    );
  }
}
