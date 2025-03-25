import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zepair/models/user_detail_model.dart';
import 'package:zepair/modules/Login%20Pages/otp_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zepair/provider/user_datails_provider.dart';

class AuthenticationBackend {
  // checks if user is logged in
  static bool isLoggedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser == null) {
      return false;
    } else {
      print(auth.currentUser!.displayName ?? " no name ");
      return true;
    }
  }

  static Future<UserDetailModel?> fetchUserDetails(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection("Users").doc(uid).get();

      if (userDoc.exists) {
        return UserDetailModel.fromFirestore(userDoc);
      } else {
        return null; // User not found
      }
    } catch (e) {
      print("❌ Error fetching user details: $e");
      return null;
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
  static void logOut() async {
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

  static void signInWithPhone(String phoneNumber, BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification might complete but we don't auto-link
          print('Auto-verification completed, but linking deferred.');
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          var snackBar = SnackBar(
            content: Text('Error:${e.message ?? "Something went Wrong"}'),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (String verificationId, int? resendToken) {
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
      print("Error: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
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

  static Future<bool> verifyOtp(String otp, String verificationId, String phone,
      BuildContext context) async {
    if (otp.length != 6) {
      // Handle invalid OTP length
      return false;
    }

    try {
      // Verify OTP with Firebase
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.linkWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Phone number linked successfully!'")),
        );
        Provider.of<UserDatailsProvider>(context, listen: false)
            .setUserPhone(phone);
        Provider.of<UserDatailsProvider>(context, listen: false)
            .checkAuthenticationAndNavigate(context);
      } else {
        print('No user signed in');
      }
      // Authentication successful, you can navigate to the next screen
      return true;
    } catch (e) {
      // Handle authentication failure
      print('Error linking: $e');
      // Handle linking error (e.g., invalid code, phone already linked)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
      return false;
    }
  }
}
