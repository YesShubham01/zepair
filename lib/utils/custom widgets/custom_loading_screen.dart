import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zepair/utils/constants/image_paths.dart';

class CustomLoadingScreen extends StatefulWidget {
  const CustomLoadingScreen({super.key});

  @override
  State<CustomLoadingScreen> createState() => _CustomLoadingScreenState();
}

class _CustomLoadingScreenState extends State<CustomLoadingScreen> {
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Center(
      child: Lottie.asset(ImagePaths.loadingLottieAnimation,
          width: w * 0.8, repeat: true, fit: BoxFit.cover),
    );
  }
}
