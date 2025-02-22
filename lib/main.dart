import 'package:flutter/material.dart';
import 'package:zepair/modules/AC%20repair/ac_repair.dart';
import 'package:zepair/modules/Splash%20Page/splash_page.dart';
import 'package:zepair/modules/bill%20page/bill_page.dart';
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
      home:  ACServicePage(),
    );
  }
}
