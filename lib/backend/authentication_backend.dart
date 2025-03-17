import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zepair/modules/Login%20Pages/otp_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationBackend {
  // checks if user is logged in
  static bool isLoggedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  // fetch uid
  static String getUserUid() {
    FirebaseAuth auth = FirebaseAuth.instance;

    return auth.currentUser?.uid ?? "Error";
  }

  //fetch username
  static String getUserName() {
    FirebaseAuth auth = FirebaseAuth.instance;

    return auth.currentUser?.displayName ?? "Error";
  }

  // sign out
  static sign_out() async {
    await FirebaseAuth.instance.signOut();
  }

  // continue with google
  static Future<bool> continueWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        await auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          print(e);
          return false;
        } else if (e.code == 'invalid-credential') {
          // handle the error here

          print(e);
          return false;
        }
      } catch (e) {
        // handle the error here
        print(e);
        return false;
      }
    }

    // FireStore().createNewUser();

    return true;
  }

  static int? _resendToken; // Store the resend token for re-sending OTP

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
          _resendToken = resendToken; // Store resendToken for future use

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

  static Future<void> resendCode(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 30),
        forceResendingToken: _resendToken, // Use stored resendToken
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.currentUser
              ?.linkWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Resend failed: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          _resendToken = resendToken; // Update resend token
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print("Error resending OTP: $e");
    }
  }

  static Future<bool> verifyOtp(String otp, String verificationId) async {
    if (otp.length != 6) {
      // Handle invalid OTP length
      return false;
    }

    try {
      // Verify OTP with Firebase
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Authentication successful, you can navigate to the next screen
      return true;
    } catch (e) {
      // Handle authentication failure
      print('Error verifying OTP: $e');
      return false;
    }
  }
}
