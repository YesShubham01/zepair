import 'package:flutter/material.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/backend/user_detail_backend_service.dart';
import 'package:zepair/models/user_detail_model.dart';

class UserDatailsProvider extends ChangeNotifier {
  bool isLogin;
  UserDetailModel userDetail = UserDetailModel();

  UserDatailsProvider({
    this.isLogin = false,
  });

  setIsLoggedIn() {
    bool val = AuthenticationBackend.isLoggedIn();
    isLogin = val;
    notifyListeners();
  }

  bool isPhoneNumberLinked() {
    return !(userDetail.phone == null);
  }

  checkAuthenticationAndNavigate(BuildContext context) {
    setIsLoggedIn();
    if (isLogin) {
      // setUserDetails(UserDetailBackendService().getUserDetails());

      if (isPhoneNumberLinked()) {
        Navigator.pushReplacementNamed(context, '/home');
        print("nav to home");
      } else {
        Navigator.pushReplacementNamed(context, '/phoneLogin');
      }
    } else {
      Navigator.pushReplacementNamed(context, '/googleLogin');
    }
  }

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

  setUserPhone(String? val) {
    userDetail.phone = val;
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
