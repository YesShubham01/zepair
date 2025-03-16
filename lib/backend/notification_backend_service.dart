import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zepair/models/notification_model.dart';

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // notifications for a specific user
  Stream<List<NotificationModel>> getUserNotifications(String uid) {
    return _firestore
        .collection('Users')
        .doc(uid)
        .snapshots()
        .map((documentSnapshot) {
      if (!documentSnapshot.exists || documentSnapshot.data() == null) {
        return [];
      }

      final userData = documentSnapshot.data()!;

      // Check if notifications field exists and is a list
      if (!userData.containsKey('notifications')) {
        return [];
      }

      List<dynamic> notificationsData = userData['notifications'] ?? [];

      // Converting each notification map to NotificationModel
      return notificationsData
          .map(
              (notificationData) => NotificationModel.fromMap(notificationData))
          .toList()
          .cast<NotificationModel>();
    });
  }

  // Add a notification for a user
  Future<void> addNotification(
      String uid, NotificationModel notification) async {
    try {
      await _firestore.collection('Users').doc(uid).update({
        'notifications': FieldValue.arrayUnion([notification.toMap()])
      });
    } catch (e) {
      print('Error adding notification: $e');
    }
  }
}
