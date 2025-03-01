// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/appointment_model.dart';

// class AppointmentService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<Appointment?> fetchAppointment(String appointment_id) async {
//     try {
//       DocumentSnapshot doc =
//           await _firestore.collection('appointments').doc(appointment_id).get();
//       if (doc.exists) {
//         return Appointment.fromFirestore(doc);
//       }
//       return null;
//     } catch (e) {
//       print("Error fetching appointment: $e");
//       return null;
//     }
//   }

//   Future<void> createAppointment(Appointment appointment) async {
//     try {
//       DocumentReference docRef =
//           await _firestore.collection('appointments').add(appointment.toFirestore());

//       await _firestore.collection('users').doc(appointment.uid).update({
//         'bookings': FieldValue.arrayUnion([docRef.id])
//       });
//     } catch (e) {
//       print("Error creating appointment: $e");
//     }
//   }

//   Future<void> updateAppointmentStatus(
//       String appointment_id, String newStatus, Timestamp newTiming) async {
//     try {
//       await _firestore.collection('appointments').doc(appointment_id).update({
//         'status': newStatus,
//         'timestamp': newTiming,
//       });
//     } catch (e) {
//       print("Error updating status: $e");
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/appointment_model.dart';

class AppointmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch Appointments Based on User ID
 Stream<List<Appointment>> fetchAppointments(String uid) {
  return FirebaseFirestore.instance
      .collection('appointments')
      .where('uid', isEqualTo: uid)
      //.orderBy('timestamp', descending: true) // Make sure index is created
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Appointment.fromFirestore(doc)).toList());
}


  // Add New Appointment
  Future<void> addAppointment(Appointment appointment) async {
    try {
      await _firestore.collection('appointments').add(appointment.toFirestore());
    } catch (e) {
      print("Error adding appointment: $e");
    }
  }
}
