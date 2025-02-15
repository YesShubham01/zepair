import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final double height;
  final double width;

  const ImageWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/otp_image.png"),
          fit: BoxFit.contain, 
        ),
      ),
    );
  }
}