import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zepair/modules/Login%20Pages/otp_page.dart';

class AuthenticationBackend {
  static Future<User?> signInWithPhone(
      String phoneNumber, BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.currentUser
              ?.linkWithCredential(credential);
          // Authentication successful, navigate to the next screen if needed
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failed
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          // Save the verificationId somewhere and navigate to OTP screen
          // to get the OTP from the user
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPVerificationPage(
                  verificationId: verificationId, phone: phoneNumber),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e);
    }
    return null;
  }
}
