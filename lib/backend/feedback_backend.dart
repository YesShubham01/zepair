import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zepair/backend/authentication_backend.dart';

class FeedbackBackend {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Submits feedback text when the "Send" button is clicked
  static Future<void> submitFeedbackText({
    required String appointmentId,
    required String feedbackText,
  }) async {
    try {
      String uid = AuthenticationBackend.getUserUid(); // Get logged-in user ID

      // Query to match `uid` and `appointmentId`
      QuerySnapshot querySnapshot = await _firestore
          .collection('Appointments')
          .where('uid', isEqualTo: uid)
          .where(FieldPath.documentId, isEqualTo: appointmentId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await querySnapshot.docs.first.reference.update({
          'customerFeebackText': feedbackText,
        });
        print("Feedback text submitted successfully");
      } else {
        print("No matching appointment found for this user.");
      }
    } catch (e) {
      print("Error submitting feedback text: $e");
    }
  }

  /// Submits rating when the "Done" button is clicked
  static Future<void> submitRating({
    required String appointmentId,
    required double rating,
  }) async {
    try {
      String uid = AuthenticationBackend.getUserUid(); // Get logged-in user ID

      // Query to match `uid` and `appointmentId`
      QuerySnapshot querySnapshot = await _firestore
          .collection('Appointments')
          .where('uid', isEqualTo: uid)
          .where(FieldPath.documentId, isEqualTo: appointmentId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await querySnapshot.docs.first.reference.update({
          'customerRating': rating,
        });
        print("Rating submitted successfully");
      } else {
        print("No matching appointment found for this user.");
      }
    } catch (e) {
      print("Error submitting rating: $e");
    }
  }
}
