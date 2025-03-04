import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zepair/models/warranty_model.dart';

class WarrantyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<WarrantyModel>> getUserWarrantiesStream(String uid) {
    return _firestore
        .collection('Users')
        .where('uid', isEqualTo: uid) // Find document where 'uid' matches
        .snapshots()
        .asyncMap((querySnapshot) async {
      try {
        if (querySnapshot.docs.isEmpty) {
          print('No user found with UID: $uid');
          return [];
        }
        //dart.dev/diagnostics/undefined_method

        DocumentSnapshot userDoc =
            querySnapshot.docs.first; // Get the first matching document

        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;

        if (userData == null || !userData.containsKey('warranties')) {
          print('User document does not exist or has no warranties field.');
          return [];
        }

        List<String> warrantyIds =
            List<String>.from(userDoc['warranties'] ?? []);

        List<Future<WarrantyModel?>> warrantyFutures =
            warrantyIds.map((id) async {
          try {
            DocumentSnapshot warrantyDoc =
                await _firestore.collection('warranties').doc(id).get();
            if (warrantyDoc.exists) {
              return WarrantyModel.fromMap(
                  id, warrantyDoc.data() as Map<String, dynamic>);
            } else {
              print('Warranty document does not exist for ID: $id');
            }
          } catch (e) {
            print('Error fetching warranty with ID $id: $e');
          }
          return null;
        }).toList();

        List<WarrantyModel> warranties = (await Future.wait(warrantyFutures))
            .whereType<WarrantyModel>()
            .toList();

        return warranties;
      } catch (e) {
        print('Error fetching user warranties: $e');
        return [];
      }
    });
  }
}
