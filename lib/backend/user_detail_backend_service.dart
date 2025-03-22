import 'package:zepair/models/user_detail_model.dart';

class UserDetailBackendService {
  // static Future<UserDetailModel?> getUserDetails() async {
  //   String uid = "";
  //   try {
  //     DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
  //         await FirebaseFirestore.instance.collection('Users').doc(uid).get();

  //     if (documentSnapshot.exists && documentSnapshot.data() != null) {
  //       return UserDetailModel.fromJson(documentSnapshot.data()!);
  //     }
  //   } catch (e) {
  //     print("Error fetching user details: $e");
  //   }
  //   return null;
  // }
}
