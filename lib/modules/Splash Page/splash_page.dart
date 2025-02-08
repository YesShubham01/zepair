import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zepair/modules/Home%20Pages/home_screen.dart';
import 'package:zepair/modules/Splash%20Page/Support%20Widgets/splash_logo.dart';
import 'package:zepair/modules/Splash%20Page/Support%20Widgets/splash_tagline.dart';
import 'package:zepair/utils/constants/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _enterFullScreenMode();
    _startNavigationTimer();
  }

  void _enterFullScreenMode() =>
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  void _startNavigationTimer() =>
      _navigationTimer = Timer(const Duration(seconds: 5), _navigateToHome);

  void _navigateToHome() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: _splashGradient),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SplashLogo(),
                SplashTagline(),
              ],
            ),
          ),
        ),
      );

  static const _splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      CustomColors.themeGradientStart,
      CustomColors.themeGradientEnd,
    ],
  );
}
