import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  final String appointment_id;
  final String uid;
  final String title;
  final double amount_paid;
  final String description;
  final String status;
  final Timestamp timestamp;
  final String imagePath;

  Appointment({
    required this.appointment_id,
    required this.uid,
    required this.title,
    required this.amount_paid,
    required this.description,
    required this.status,
    required this.timestamp,
    required this.imagePath,
  });

  // Convert Firestore DocumentSnapshot to Appointment Model
  factory Appointment.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Appointment(
      appointment_id: doc.id,
      uid: data['uid'] ?? '',
      title: data['title'] ?? '',
      amount_paid: (data['amount_paid'] ?? 0).toDouble(),
      description: data['description'] ?? '',
      status: data['status'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      imagePath: data['imagePath'] ?? '',
    );
  }

  // Convert Appointment Model to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'title': title,
      'amount_paid': amount_paid,
      'description': description,
      'status': status,
      'timestamp': timestamp,
    };
  }
}

