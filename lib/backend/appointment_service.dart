import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/provider/user_datails_provider.dart';
import '../models/appointment_model.dart';

class AppointmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch Appointments Based on User ID
  Stream<List<Appointment>> fetchAppointments(String uid) {
    return FirebaseFirestore.instance
        .collection('Appointments')
        .where('uid', isEqualTo: uid)
        //.orderBy('timestamp', descending: true) // Make sure index is created
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Appointment.fromFirestore(doc))
            .toList());
  }

  // Add New Appointment
  static Future<void> addAppointment(
      Appointment appointment, BuildContext context) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      String appointmentUid = appointment.razorpayOrderId;
      await firestore
          .collection('Appointments')
          .doc(appointmentUid) // Use orderId as the document ID
          .set(appointment.toFirestore());

      print(
          "Appointment added successfully with ID: ${appointment.razorpayOrderId}");

      // also add appointment Id to user's detail.
      context.read<UserDetailsProvider>().addAppointmentId(appointmentUid);
    } catch (e) {
      print("Error adding appointment: $e");
    }
  }

  Stream<List<Appointment>> getUserAppointments() {
    String uid = AuthenticationBackend.getUserUid();
    return _firestore
        .collection('Users')
        .doc(uid)
        .snapshots()
        .asyncMap((userDoc) async {
      if (!userDoc.exists || userDoc.data() == null) {
        return [];
      }

      // Extract booking IDs from user document
      List<String> bookingIds = List<String>.from(userDoc['bookings'] ?? []);

      if (bookingIds.isEmpty) {
        return [];
      }

      // Fetch appointments in real-time where appointmentId matches
      QuerySnapshot appointmentDocs = await _firestore
          .collection('Appointments')
          .where(FieldPath.documentId, whereIn: bookingIds)
          .get();

      // Convert Firestore documents to Appointment model
      return appointmentDocs.docs
          .map((doc) => Appointment.fromFirestore(doc))
          .toList();
    });
  }

  Stream<Appointment?> getAssignedAppointment() {
    String uid = AuthenticationBackend.getUserUid(); // Get logged-in user ID

    return _firestore
        .collection('Appointments')
        .where('uid', isEqualTo: uid) // Filter by user ID
        .where('isAssigned', isEqualTo: true) // Only assigned appointments
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return Appointment.fromFirestore(snapshot.docs.first);
      }
      return null; // No active appointment for this user
    });
  }

  Stream<bool> isAppointmentCompleted(String appointmentId) {
    return _firestore
        .collection('Appointments')
        .doc(appointmentId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        return snapshot.data()!['isCompleted'] ?? false;
      }
      return false;
    });
  }
}
