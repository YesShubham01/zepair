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

// fetchMainServices
  Stream<ServiceModel> fetchServices(String title) {
    try {
      return _firestore
          .collection('Services')
          .where('title', isEqualTo: title)
          .snapshots()
          .map((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          var doc = querySnapshot.docs.first; // Get first matching document
          return ServiceModel.fromMap(doc.data() as Map<String, dynamic>);
        } else {
          throw Exception("No service data found for $title");
        }
      });
    } catch (e) {
      throw Exception("Error fetching services: $e");
    }
  }

//fetchOtherServices
  Stream<ServiceModel> fetchOtherServices(String title) {
    try {
      return _firestore
          .collection('Services')
          .where('title', isEqualTo: title)
          .snapshots()
          .asyncMap((querySnapshot) async {
        if (querySnapshot.docs.isNotEmpty) {
          var doc = querySnapshot.docs.first; // Get first matching document
          var serviceData = doc.data() as Map<String, dynamic>;

          // Fetch Other_Services collection inside this document
          var otherServicesSnapshot = await _firestore
              .collection('Services')
              .doc(doc.id) // Reference to the main service doc
              .collection('Other_Services')
              .get();

          Map<String, List<Map<String, dynamic>>> otherServices = {};

          for (var otherServiceDoc in otherServicesSnapshot.docs) {
            otherServices[otherServiceDoc.id] = List<Map<String, dynamic>>.from(
                otherServiceDoc.data()['services'] ?? []);
          }

          // Add fetched Other_Services to the service data
          serviceData['Other_Services'] = otherServices;

          return ServiceModel.fromMap(serviceData);
        } else {
          throw Exception("No service data found for $title");
        }
      });
    } catch (e) {
      throw Exception("Error fetching services: $e");
    }
  }
}
