import 'package:flutter/material.dart';
import 'package:zepair/modules/Contact%20Page/contactUs.dart';
import 'package:zepair/modules/Feedback%20Page/feedback_page.dart';
import 'package:zepair/modules/Home%20Pages/home_page.dart';
import 'package:zepair/modules/Home%20Pages/home_screen.dart';
import 'package:zepair/modules/Services/service_detail.dart';
import 'package:zepair/modules/Splash%20Page/splash_page.dart';
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
      home: const ServiceDetailPage(
          service: 'AC Service',
          description:
              'Get your AC cleaned and serviced to extend its lifespan and reduce power consumption.'),
    );
  }
}
