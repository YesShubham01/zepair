import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zepair/models/service_detail_model.dart';

class ServiceBackendService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream to fetch services in real-time
  Stream<List<ServiceModel>> getAvailableServices() {
    return _firestore.collection('Services').snapshots().map((snapshot) {
      return snapshot.docs
          .map(
              (doc) => ServiceModel.fromMap(doc.data() as Map<String, dynamic>))
          .where(
              (service) => service.available) // Filter only available services
          .toList();
    });
  }

  Future<ServiceModel> fetchServices() async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('Services').doc('AC').get();
      if (snapshot.exists) {
        return ServiceModel.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("No service data found");
      }
    } catch (e) {
      throw Exception("Error fetching services: $e");
    }
  }
}
