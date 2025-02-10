import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import '../../../utils/custom widgets/custom_text.dart';

class BookingCard extends StatefulWidget {
  final String serviceName;
  final String amountPaid;
  final String description;
  final String status;
  final String? highlightedStatus; // Optional for highlighted text

  const BookingCard({
    super.key,
    required this.serviceName,
    required this.amountPaid,
    required this.description,
    required this.status,
    this.highlightedStatus,
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: w * 0.12,
                  height: h * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.serviceName,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      fontFamily: FontType.balooBhai2,
                      text: "Amount Paid ₹ ${widget.amountPaid}",
                      size: 18,
                      weight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 4),
            CustomText(
              text: "· ${widget.description}",
              size: 15,
              color: Colors.black54,
              fontFamily: FontType.balooBhai2,
            ),
            const SizedBox(height: 2),
            const Divider(thickness: 3, color: Colors.grey),
            const SizedBox(height: 2),
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
                  if (widget.highlightedStatus != null) ...[
                    const TextSpan(text: " "),
                    TextSpan(
                      text: widget.highlightedStatus,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontFamily: 'SF-Pro',
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
