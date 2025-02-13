import 'package:flutter/material.dart';

import 'package:zepair/modules/sharing_otp/sharing_otp.dart';
import 'package:zepair/utils/constants/colors.dart';

void main() {
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
      home: ServiceProgressPage(otp: "12345"),
    );
  }
}
