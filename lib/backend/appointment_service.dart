import 'package:cloud_firestore/cloud_firestore.dart';
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
  static Future<void> addAppointment(Appointment appointment) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection('Appointments')
          .doc(appointment.razorpayOrderId) // Use orderId as the document ID
          .set(appointment.toFirestore());

      print(
          "Appointment added successfully with ID: ${appointment.razorpayOrderId}");
    } catch (e) {
      print("Error adding appointment: $e");
    }
  }
}
