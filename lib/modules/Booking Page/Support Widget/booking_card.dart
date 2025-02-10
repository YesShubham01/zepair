import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/custom widgets/custom_text.dart';

class BookingCard extends StatelessWidget {
  late double h;
  late double w;
  final String serviceName;
  final String amountPaid;
  final String description;
  final String status;
  final String? highlightedStatus; // Optional for highlighted text

  BookingCard({
    super.key,
    required this.serviceName,
    required this.amountPaid,
    required this.description,
    required this.status,
    this.highlightedStatus,
  });

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: CustomColors.cardBg,
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
                      text: serviceName,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "Amount Paid ₹ $amountPaid",
                      size: 18,
                      weight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 4),
            CustomText(
              text: "· $description",
              size: 15,
              color: Colors.black54,
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
                ),
                children: [
                  const TextSpan(text: "Status: "),
                  TextSpan(
                    text: status,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  if (highlightedStatus != null) ...[
                    const TextSpan(text: " "),
                    TextSpan(
                      text: highlightedStatus,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.brown),
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
