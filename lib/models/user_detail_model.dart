import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String phone;
  final String bookings;

  UserModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.bookings
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};

    return UserModel(
      uid: doc.id,
      name: data['name'] ?? 'Unknown',
      phone: data['phone'] ?? 'No phone',
      bookings: data['bookings'] ?? 'no bookings',
    );
  }
}
