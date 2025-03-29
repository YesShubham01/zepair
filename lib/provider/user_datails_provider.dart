import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/models/user_detail_model.dart';

class UserDetailsProvider extends ChangeNotifier {
  bool isLogin;
  UserDetailModel userDetail = UserDetailModel();

  UserDetailsProvider({
    this.isLogin = false,
  });

  setIsLoggedIn() {
    bool val = AuthenticationBackend.isLoggedIn();
    isLogin = val;
    notifyListeners();
  }

  bool isPhoneNumberLinked() {
    print("phone number : ${userDetail.phone}");
    return !(userDetail.phone == null || userDetail.phone == "");
  }

  checkAuthenticationAndNavigate(BuildContext context) {
    setUserDetails();
    setIsLoggedIn();
    if (isLogin) {
      if (isPhoneNumberLinked()) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        print("nav to home");
      } else {
        Navigator.pushReplacementNamed(context, '/phoneLogin');
      }
    } else {
      Navigator.pushReplacementNamed(context, '/googleLogin');
    }
  }

  Future<void> setUserDetails() async {
    String? uid = AuthenticationBackend.getUserUid();
    print("User UID: $uid");

    if (uid.isEmpty) {
      print("Uid is null");
      return;
    }

    UserDetailModel? userData =
        await AuthenticationBackend.fetchUserDetails(uid);

    if (userData != null) {
      //case 1: user already exist, fetch details
      userDetail = userData;
      notifyListeners();
    } else {
      //case 2 : user doesn't exist createUser
      UserDetailModel newUser = UserDetailModel(
        name: AuthenticationBackend.getUserName(),
        uid: uid,
      );
      userDetail = newUser;
      notifyListeners();
    }
    _updateUserInFirestore();
  }

  isUserNameNull() {
    if (userDetail.name == null) {
      return true;
    }
    return false;
  }

  setUserName(String? val) {
    setUserUid();
    userDetail.name = val;
    notifyListeners();
  }

  setUserPhone(String? val) {
    userDetail.phone = val;
    _updateUserInFirestore();
    notifyListeners();
  }

  void setUserUid() {
    userDetail.uid = AuthenticationBackend.getUserUid();
  }

  // void setNotification(BuildContext context) async {
  //   userDetail.notification = await FireStore.fetchNotifications(context);
  // }

  // List<String>? getNotifications() {
  //   return userDetail.notification;
  // }

  // String? getNotificationNumber() {
  //   return userDetail.notification?.length.toString();
  // }

  void updateSelectedAddressIndex(int index) async {
    userDetail.selectedAddressIndex = index; // ✅ Update local state
    notifyListeners();
    _updateUserInFirestore(); // ✅ Notify UI to rebuild
  }

  /// **🔥 Updates Firestore whenever user details are changed**
  Future<void> _updateUserInFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userDetail.uid)
          .set({
        "uid": userDetail.uid,
        "name": userDetail.name ?? '',
        "phone": userDetail.phone ?? '',
        "bookings": userDetail.bookings ?? [],
        "addresses": userDetail.addresses
            ?.map((e) => {
                  "name": e.name,
                  "phone": e.phone,
                  "address": e.address,
                  "coordinates": e.coordinates,
                  "type": e.type,
                })
            .toList(),
        "warranties": userDetail.warranties ?? [],
        "selectedAddressIndex": userDetail.selectedAddressIndex ?? 0,
      }, SetOptions(merge: true)); // ✅ Merges with existing data

      print("✅ Firestore updated successfully!");
    } catch (e) {
      print("❌ Error updating Firestore: $e");
    }
  }
}
