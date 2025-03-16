import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/backend/notification_backend_service.dart';
import 'package:zepair/models/notification_model.dart';
import 'package:zepair/modules/Notification%20Page/Support%20Widgets/notification_item.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_loading_screen.dart';

class NotificationPage extends StatefulWidget {
  final String? uid;

  const NotificationPage({super.key, this.uid});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late double w;
  late double h;
  final NotificationService _notificationService = NotificationService();

  // Default user ID if none provided (for testing)
  String get _userId => widget.uid ?? "User ID";

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
      body: StreamBuilder<List<NotificationModel>>(
        stream: _notificationService.getUserNotifications(_userId),
        builder: (context, snapshot) {
          // Show loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CustomLoadingScreen());
          }

          // Show error state
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Get notifications list
          final notifications = snapshot.data ?? [];

          // Show empty state or notifications list
          return notifications.isEmpty
              ? _buildEmptyNotifications()
              : _buildNotificationsList(notifications);
        },
      ),
    );
  }

  Widget _buildNotificationsList(List<NotificationModel> notifications) {
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
