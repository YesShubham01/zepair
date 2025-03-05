import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zepair/models/message.dart';

class MessageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String message,
    required String messageType, // "User" or "Technician"
    required String userId,
    required String phone,
  }) async {
    try {
      String messageId = "Message_${DateTime.now().millisecondsSinceEpoch}"; // Custom ID
      Timestamp timestamp = Timestamp.now(); // ✅ Capture current time

      Message newMessage = Message(
        messageId: messageId,
        message: message,
        phone: phone,
        messageType: messageType,
        userId: userId,
        timestamp: timestamp, // ✅ Include timestamp
      );

      await _firestore.collection("Messages").doc(messageId).set(newMessage.toMap());

      print("Message sent successfully!");
    } catch (e) {
      print("Error sending message: $e");
    }
  }
}

