import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentDetailModel {
  final String deviceType; // Added deviceType
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
  final String? assignedDate;
  final String? assignedTime;
  final String? technicianId;
  final String? otp;
  final bool? isAssigned;
  final bool? isCompleted;
  final double? customerRating;
  final String? customerFeebackText;

  AppointmentDetailModel({
    required this.deviceType, // Added deviceType
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
    this.assignedDate,
    this.assignedTime,
    this.technicianId,
    this.otp,
    this.isAssigned,
    this.isCompleted,
    this.customerRating,
    this.customerFeebackText,
  });

  // Convert Firestore DocumentSnapshot to AppointmentDetailModel
  factory AppointmentDetailModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return AppointmentDetailModel(
      deviceType: data['deviceType'] ?? '', // Added deviceType
      appointmentId: doc.id,
      uid: data['uid'] ?? '',
      title: data['title'] ?? '',
      amountPaid: (data['amountPaid'] ?? 0).toDouble(),
      description: data['description'] ?? '',
      status: data['status'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      imagePath: data['imagePath'] ?? '',
      razorpayOrderId: data['razorpayOrderId'] ?? '',
      razorpayPaymentId: data['razorpayPaymentId'] ?? '',
      razorpayPaymentSignature: data['razorpayPaymentSignature'] ?? '',
      assignedDate: data['assignedDate'] ?? '',
      assignedTime: data['assignedTime'] ?? '',
      technicianId: data['technicianId'] ?? '',
      otp: data['otp'] ?? '',
      isAssigned: data['isAssigned'] ?? false,
      isCompleted: data['isCompleted'] ?? false,
      customerRating: (data['customerRating'] ?? 0).toDouble(),
      customerFeebackText: data['customerFeebackText'],
    );
  }

  // Convert AppointmentDetailModel to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {
      'deviceType': deviceType, // Added deviceType
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
      'assignedDate': assignedDate,
      'assignedTime': assignedTime,
      'technicianId': technicianId,
      'otp': otp,
      'isAssigned': isAssigned,
      'isCompleted': isCompleted,
      'customerRating': customerRating,
      'customerFeebackText': customerFeebackText,
    };
  }
}
