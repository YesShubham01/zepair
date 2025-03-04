import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/serviceEnum.dart';
import '../../../utils/custom widgets/custom_text.dart';

class BookingCard extends StatefulWidget {
  final Device device;
  final String amountPaid;
  final String description;
  final String status;

  const BookingCard({
    super.key,
    required this.device,
    required this.amountPaid,
    required this.description,
    required this.status,
  });

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  late double h;
  late double w;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return CustomCardWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomCardWidget(
                  child: SizedBox(
                    height: h * 0.06,
                    width: w * 0.12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(widget.device.icon),
                    ),
                  ),
                ),
                Gap(h * 0.006),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.device.title,
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      fontFamily: FontType.balooBhai2,
                      text: "Amount Paid ₹ ${widget.amountPaid}",
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
            Gap(h * 0.001),
            CustomText(
              text: "· ${widget.description}",
              size: 15,
              color: Colors.black54,
              fontFamily: FontType.balooBhai2,
            ),
            const Divider(thickness: 3, color: Colors.grey),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF-Pro',
                ),
                children: [
                  const TextSpan(text: "Status: "),
                  TextSpan(
                    text: widget.status,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF-Pro',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
