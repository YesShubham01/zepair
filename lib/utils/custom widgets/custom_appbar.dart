import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Accepts title dynamically

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
      title: Row(
        children: [
          const Gap(5), // 5 pixels spacing between the icon and text
          CustomText(
            text: title,
            size: 24,
            fontFamily: FontType.sfPro,
            color: Colors.black,
            weight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
