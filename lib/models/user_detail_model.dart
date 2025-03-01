import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String name;
  
  final List<String> bookings;

  User({
    required this.uid,
    required this.name,
    required this.bookings,
    
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return User(
      uid: doc.id,
      name: data['name'] ?? '',
    
      bookings: List<String>.from(data['bookings'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'bookings': bookings,
    };
  }
}
