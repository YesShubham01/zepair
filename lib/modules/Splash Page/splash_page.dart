import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zepair/devs/notes.dart';
import 'package:flutter/services.dart';
import 'package:zepair/modules/Splash%20Page/Support%20Widgets/splash_content.dart';
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

  void _enterFullScreenMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void _startNavigationTimer() {
    _navigationTimer = Timer(const Duration(seconds: 5), _navigateToHome);
  }

  void _navigateToHome() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const NotesForDevs()),
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors.themeGradientStart,
              CustomColors.themeGradientEnd,
            ],
          ),
        ),
        child: const Center(
          child: SplashContent(),
        ),
      ),
    );
  }
}
