import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/bookCall_model.dart';


class CallService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> bookCall({
    required String userId,
    required String phone,
  }) async {
    try {
      String callId = "Call_${DateTime.now().millisecondsSinceEpoch}"; // Unique Call ID
      Timestamp time = Timestamp.now(); // Store current system time

      BookCall newCall = BookCall(
        callId: callId,
        type: "User", // Default type for now
        userId: userId,
        phone: phone,
        time: time,
      );

      await _firestore.collection("BookCall").doc(callId).set(newCall.toMap());

      print("Call booked successfully!");
    } catch (e) {
      print("Error booking call: $e");
    }
  }
}
