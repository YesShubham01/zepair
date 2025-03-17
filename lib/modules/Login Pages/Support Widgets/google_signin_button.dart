import 'package:flutter/material.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/modules/Home%20Pages/home_screen.dart';
import 'package:zepair/utils/constants/colors.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  late double w;
  late double h;
  bool _isSigningIn = false;

  _check_login() async {
    if (AuthenticationBackend.isLoggedIn()) {
      // context.read<MyProvider>().setLogined(true);
      // context
      //     .read<MyProvider>()
      //     .setUserDetails(await FireStore().getUserDetails());
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed!'),
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;
    return _isSigningIn
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(CustomColors.primary),
          )
        : OutlinedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(255, 255, 255, 1)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            onPressed: () async {
              setState(() {
                _isSigningIn = true;
              });

              if (await AuthenticationBackend.continueWithGoogle()) {
                _check_login();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed!'),
                    duration:
                        Duration(seconds: 3), // Adjust the duration as needed
                  ),
                );
              }

              setState(() {
                _isSigningIn = false;
              });
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/google_logo.png"),
                    height: 35.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
