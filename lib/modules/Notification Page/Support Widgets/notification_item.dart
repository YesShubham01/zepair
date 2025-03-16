import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/models/notification_model.dart';
import 'package:zepair/modules/Booking%20Page/bookings_page.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final double width;
  final double height;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Received at time
        Padding(
          padding: EdgeInsets.only(left: width * 0.02),
          child: CustomText(
            text: notification.getFormattedTime(),
            size: 11,
            color: Colors.grey.shade700,
            weight: FontWeight.w400,
            fontFamily: FontType.balooBhai2,
          ),
        ),
        Gap(height * 0.005),

        // Notification card
        Container(
          width: width * 0.9,
          padding: EdgeInsets.all(width * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Notification message
              CustomText(
                text: notification.message,
                size: 16,
                color: Colors.black87,
                weight: FontWeight.w300,
                fontFamily: FontType.sfPro,
              ),
              Gap(height * 0.01),

              // Action button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // handle different routes based on actionRoute, uncomment when ready
                    // _handleNavigation(context, notification.actionRoute);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.005,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: CustomText(
                    text: notification.actionText,
                    size: 14,
                    color: CustomColors.primary,
                    weight: FontWeight.w500,
                    fontFamily: FontType.sfPro,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // please look into this, this will be implemented after all routes are ready.
  void _handleNavigation(BuildContext context, String route) {
    switch (route) {
      case '/schedule':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SchedulePage()));
        break;
      // Add other routes as needed
      default:
        // default action for unknown routes
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Navigation not implemented')));
    }
  }
}
