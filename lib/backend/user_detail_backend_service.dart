import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_detail_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> fetchUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return User.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print("Error fetching user: $e");
      return null;
    }
  }
}
