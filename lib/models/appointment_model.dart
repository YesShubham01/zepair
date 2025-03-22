import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  final String appointmentId;
  final String uid;
  final String title;
  final double amountPaid;
  final String description;
  final String status;
  final Timestamp timestamp;
  final String imagePath;
  final String razorpayOrderId;
  final String razorpayPaymentId;
  final String razorpayPaymentSignature;

  Appointment({
    required this.appointmentId,
    required this.uid,
    required this.title,
    required this.amountPaid,
    required this.description,
    required this.status,
    required this.timestamp,
    required this.imagePath,
    required this.razorpayOrderId,
    required this.razorpayPaymentId,
    required this.razorpayPaymentSignature,
  });

  // Convert Firestore DocumentSnapshot to Appointment Model
  factory Appointment.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Appointment(
      appointmentId: doc.id,
      uid: data['uid'] ?? '',
      title: data['title'] ?? '',
      amountPaid: (data['amountPaid'] ?? 0).toDouble(),
      description: data['description'] ?? '',
      status: data['status'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      imagePath: data['imagePath'] ?? '',
      razorpayOrderId: data["razorpayOrderId"] ?? '',
      razorpayPaymentId: data["razorpayPaymentId"] ?? '',
      razorpayPaymentSignature: data["razorpayPaymentSignature"] ?? '',
    );
  }

  // Convert Appointment Model to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'title': title,
      'amountPaid': amountPaid,
      'description': description,
      'status': status,
      'timestamp': timestamp,
      'imagePath': imagePath,
      'razorpayOrderId': razorpayOrderId,
      'razorpayPaymentId': razorpayPaymentId,
      'razorpayPaymentSignature': razorpayPaymentSignature,
    };
  }
}
