import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String messageId;
  final String message;
  final String phone;
  final String messageType; // "User" or "Technician"
  final String userId;
  final Timestamp timestamp; // ✅ Added timestamp field

  Message({
    required this.messageId,
    required this.message,
    required this.phone,
    required this.messageType,
    required this.userId,
    required this.timestamp, // ✅ Updated constructor
  });

  Map<String, dynamic> toMap() {
    return {
      "messageId": messageId,
      "message": message,
      "phone": phone,
      "messageType": messageType,
      "userId": userId,
      "timestamp": timestamp, // ✅ Storing timestamp
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      messageId: map["messageId"] ?? "",
      message: map["message"] ?? "",
      phone: map["phone"] ?? "",
      messageType: map["messageType"] ?? "",
      userId: map["userId"] ?? "",
      timestamp: map["timestamp"] ?? Timestamp.now(), // ✅ Fetching timestamp, default to current time
    );
  }
}
