import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_detail_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_detail_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> fetchUserData(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('Users').doc(uid).get();

      if (doc.exists && doc.data() != null) {
        return UserModel.fromFirestore(doc);
      }
    } catch (e) {
      print("Error fetching user: $e");
    }
    return null;
  }
}

