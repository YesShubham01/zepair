import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Notification%20Page/Models/notification_model.dart';
import 'package:zepair/modules/Notification%20Page/Support%20Widgets/notification_item.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late double w;
  late double h;

  // please take care of the routes..
  final List<NotificationModel> notifications = [
    NotificationModel(
      id: '1',
      message:
          'We have assigned one of our engineer for your AC Service Request.',
      receivedAt: DateTime.now().subtract(const Duration(hours: 1)),
      actionText: 'Check Schedule',
      actionRoute: '/schedule',
    ),
    NotificationModel(
      id: '2',
      message:
          'Your Warranty of AC Service has been expired. Thankyou for being our valueable customer.',
      receivedAt: DateTime.now().subtract(const Duration(days: 2)),
      actionText: 'Warranty Page',
      actionRoute: '/warranty',
    ),
    NotificationModel(
      id: '3',
      message:
          'Your service request #12345 has been completed. Please rate your experience.',
      receivedAt: DateTime.now().subtract(const Duration(hours: 5)),
      actionText: 'Rate Now',
      actionRoute: '/rating',
    ),
    NotificationModel(
      id: '4',
      message: 'Special discount on AC servicing this weekend! Avail now.',
      receivedAt: DateTime.now().subtract(const Duration(days: 1)),
      actionText: 'View Offer',
      actionRoute: '/offers',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        applyBackButton: true,
        title: "Notifications",
      ),
      body: notifications.isEmpty
          ? _buildEmptyNotifications()
          : _buildNotificationsList(),
    );
  }

  Widget _buildNotificationsList() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      itemCount: notifications.length,
      separatorBuilder: (context, index) => Gap(h * 0.02),
      itemBuilder: (context, index) {
        return NotificationItem(
          notification: notifications[index],
          width: w,
          height: h,
        );
      },
    );
  }

  Widget _buildEmptyNotifications() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: w * 0.2,
            color: Colors.grey,
          ),
          Gap(h * 0.02),
          const Text(
            'No notifications yet',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
