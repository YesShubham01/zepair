import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_detail_model.dart';

class UserService {
  // ✅ Get user data as a Future (for one-time fetch)
  static Future<UserDetailModel?> fetchUserData(String uid) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      DocumentSnapshot doc = await firestore.collection('Users').doc(uid).get();

      if (doc.exists && doc.data() != null) {
        return UserDetailModel.fromFirestore(doc);
      }
    } catch (e) {
      print("Error fetching user: $e");
    }
    return null;
  }

  // ✅ Get user data as a Stream (for real-time updates)
  Stream<UserDetailModel?> streamUserData(String uid) async* {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('uid', isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print("❌ User with UID $uid not found!");
        yield null;
        return;
      }

      String docId = querySnapshot.docs.first.id;

      // ✅ Log when data is fetched
      yield* firestore.collection('Users').doc(docId).snapshots().map((doc) {
        if (doc.exists && doc.data() != null) {
          return UserDetailModel.fromFirestore(doc);
        }
        return null;
      });
    } catch (e) {
      print("🚨 Error in streamUserData: $e");
      yield null;
    }
  }

  // ✅ Add Address and return success/failure
  Future<bool> addUserAddress({
    required String uid,
    required String name,
    required String phone,
    required String address,
    required Map<String, double> coordinates,
    required String type,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Step 1: Find the document where uid == "12345"
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('uid', isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print("User with UID $uid not found!");
        return false; // ❌ Return false if user is not found
      }

      // Step 2: Get the correct document ID from Firestore
      String docId = querySnapshot.docs.first.id;
      DocumentReference userRef = firestore.collection('Users').doc(docId);

      // Step 3: Update the addresses array
      Map<String, dynamic> newAddress = {
        'name': name,
        'phone': phone,
        'address': address,
        'coordinates': coordinates,
        'type': type,
      };
      await userRef.update({
        'addresses': FieldValue.arrayUnion([newAddress]),
      });

      print("Address added successfully for UID: $uid!");
      return true; // ✅ Return true if update was successful
    } catch (e) {
      print("Error adding address: $e");
      return false; // ❌ Return false in case of an error
    }
  }

  // ✅ Update Address and return success/failure
  Future<bool> updateUserAddress({
    required String uid,
    required String oldAddress, // The full old address to identify it
    required String name,
    required String phone,
    required String newAddress,
    required Map<String, double> coordinates,
    required String type,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Step 1: Find the user document where uid == "12345"
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('uid', isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print("User with UID $uid not found!");
        return false; // ❌ Return false if user is not found
      }

      // Step 2: Get the correct document ID
      String docId = querySnapshot.docs.first.id;
      DocumentReference userRef = firestore.collection('Users').doc(docId);

      // Step 3: Retrieve existing addresses
      DocumentSnapshot userDoc = await userRef.get();
      List<dynamic> addresses = List.from(userDoc['addresses'] ?? []);

      // Step 4: Find and update the matching address
      int index = addresses.indexWhere((addr) => addr['address'] == oldAddress);
      if (index == -1) {
        print("Address not found!");
        return false; // ❌ Address not found
      }

      // Step 5: Update the address details
      addresses[index] = {
        'name': name,
        'phone': phone,
        'address': newAddress,
        'coordinates': coordinates,
        'type': type,
      };

      // Step 6: Push updated addresses array to Firestore
      await userRef.update({'addresses': addresses});

      print("✅ Address updated successfully for UID: $uid!");
      return true;
    } catch (e) {
      print("Error updating address: $e");
      return false;
    }
  }

  // ✅ Delete  Address and return success/failure
  Future<bool> deleteUserAddress(String uid, String addressToDelete) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Step 1: Find the user document where uid == "12345"
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('uid', isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print("❌ User with UID $uid not found!");
        return false;
      }

      // Step 2: Get the correct document ID from Firestore
      String docId = querySnapshot.docs.first.id;
      DocumentReference userRef = firestore.collection('Users').doc(docId);

      // Step 3: Retrieve current addresses
      DocumentSnapshot userDoc = await userRef.get();
      List<dynamic> addresses =
          (userDoc.data() as Map<String, dynamic>)['addresses'] ?? [];

      // Step 4: Remove the address that matches
      List<dynamic> updatedAddresses = addresses.where((addr) {
        return addr['address'] !=
            addressToDelete; // Keep only non-matching addresses
      }).toList();

      // Step 5: Update Firestore
      await userRef.update({
        'addresses': updatedAddresses,
      });

      print("✅ Address deleted successfully!");
      return true;
    } catch (e) {
      print("🚨 Error deleting address: $e");
      return false;
    }
  }
}
