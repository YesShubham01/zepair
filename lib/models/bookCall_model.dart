import 'package:cloud_firestore/cloud_firestore.dart';

class BookCall {
  final String callId;
  final String type; // "User" or "Technician"
  final String userId;
  final String phone;
  final Timestamp time;

  BookCall({
    required this.callId,
    required this.type,
    required this.userId,
    required this.phone,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      "callId": callId,
      "type": type,
      "userId": userId,
      "phone": phone,
      "time": time,
    };
  }

  factory BookCall.fromMap(Map<String, dynamic> map) {
    return BookCall(
      callId: map["callId"] ?? "",
      type: map["type"] ?? "",
      userId: map["userId"] ?? "",
      phone: map["phone"] ?? "",
      time: map["time"] ?? Timestamp.now(),
    );
  }
}
