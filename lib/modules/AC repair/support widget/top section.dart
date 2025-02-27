import 'package:flutter/material.dart';

class TopImagePlaceholder extends StatelessWidget {
  final double height;
  final double width;
  const TopImagePlaceholder({required this.height, required this.width, super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.grey[300], // Placeholder color
      child: const Center(child: Text("")),
    );
  }
}