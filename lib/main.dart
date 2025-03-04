import 'package:flutter/material.dart';
import 'package:zepair/modules/Home%20Pages/home_page.dart';
import 'package:zepair/modules/Home%20Pages/home_screen.dart';
import 'package:zepair/modules/Login%20Pages/language_page.dart';
import 'package:zepair/modules/Login%20Pages/login_page.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/manage_addresses_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zepair/firebase_options.dart';
import 'package:zepair/modules/Splash%20Page/splash_page.dart';

import 'package:zepair/utils/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ZepairApp());
}

class ZepairApp extends StatelessWidget {
  const ZepairApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zepair',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primary),
        useMaterial3: true,
        fontFamily: 'SF-Pro',
      ),
      debugShowCheckedModeBanner: false,

      // call here the page you are working on.
      home:  ACServicePage(),
    );
  }
}
