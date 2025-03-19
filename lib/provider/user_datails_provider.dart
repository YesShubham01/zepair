import 'package:flutter/material.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/models/user_detail_model.dart';

class UserDatailsProvider extends ChangeNotifier {
  bool isLoggined;
  UserDetailModel userDetail = UserDetailModel();

  UserDatailsProvider({
    this.isLoggined = false,
  });

  setUserDetails(UserDetailModel user) {
    userDetail = user;
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

  isUserPhoneNull() {
    if (userDetail.phone == null) {
      return true;
    }
    return false;
  }

  setUserPhone(String? val) {
    userDetail.phone = val;
    notifyListeners();
  }

  setIsLoggedIn() {
    bool val = AuthenticationBackend.isLoggedIn();
    isLoggined = val;
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
}
