import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zepair/devs/notes.dart';
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
    _startNavigationTimer();
  }

  void _startNavigationTimer() {
    _navigationTimer = Timer(const Duration(seconds: 5), _navigateToHome);
  }

  void _navigateToHome() {
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
        child: Center(
          child: _getSplashContent(),
        ),
      ),
    );
  }

  _getSplashContent() {
    return const Text(
      'Zepair',
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w100,
        color: Colors.black,
      ),
    );
  }
}
