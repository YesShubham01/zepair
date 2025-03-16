import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id;
  final String message;
  final DateTime receivedAt;
  final String actionText;
  final String actionRoute;

  NotificationModel({
    required this.id,
    required this.message,
    required this.receivedAt,
    required this.actionText,
    required this.actionRoute,
  });

  // formating received time to display as "Received at HH:MM"
  String getFormattedTime() {
    final hour = receivedAt.hour.toString().padLeft(2, '0');
    final minute = receivedAt.minute.toString().padLeft(2, '0');
    return 'Received at $hour:$minute';
  }

  // Convert Firestore data to NotificationModel
  factory NotificationModel.fromMap(Map<String, dynamic> data) {
    // Handle Timestamp conversion to DateTime
    DateTime receivedTime;
    if (data['receivedAt'] is Timestamp) {
      receivedTime = (data['receivedAt'] as Timestamp).toDate();
    } else {
      receivedTime = DateTime.now();
    }

    return NotificationModel(
      id: data['id'] ?? '',
      message: data['message'] ?? '',
      receivedAt: receivedTime,
      actionText: data['actionText'] ?? 'View',
      actionRoute: data['actionRoute'] ?? '/',
    );
  }

  // Convert NotificationModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'receivedAt': Timestamp.fromDate(receivedAt),
      'actionText': actionText,
      'actionRoute': actionRoute,
    };
  }
}
